part of 'search_page.dart';

class SearchEditingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;
  final List<String> tabLabels;
  final bool isCollapsed;
  static const double collapsedHeight = kToolbarHeight + 15;
  double get _collapsedHeight => SearchEditingAppBar.collapsedHeight;
  final double _expandedHeight = 110;

  const SearchEditingAppBar({super.key, required this.context, required this.tabLabels, required this.isCollapsed});

  SearchBloc get bloc => context.read<SearchBloc>();
  SearchAppbarCubit get appbarCubit => context.read<SearchAppbarCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchAppbarCubit, bool>(builder: (context, isEditing) {
      List<Widget> actions = (isEditing)
          ? [
              TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: context.colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    bloc.add(const SearchCancel());
                    appbarCubit.submit();
                    if (bloc.state.keyword.isEmpty) context.pop();
                  },
                  child: const Text("Cancel"))
            ]
          : [];
      List<Widget> tabbar = (isEditing) ? [] : [
        Flexible(
          child: TabBar(
            tabAlignment: TabAlignment.fill,
            tabs: List.generate(
                tabLabels.length,
                    (i) => Tab(
                  iconMargin: EdgeInsets.zero,
                  text: tabLabels[i],
                )),
          ),
        ),
      ];
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: context.colorScheme.primary,
          borderRadius: isEditing ? BorderRadius.zero : const BorderRadius.vertical(bottom: Radius.circular(30))
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: _collapsedHeight,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [Flexible(child: AppSearchBar()), ...actions],
                  ),
                ),
              ...tabbar
            ],
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => AppBar(
          toolbarHeight: context.read<SearchAppbarCubit>().isEditing ? _collapsedHeight : _expandedHeight)
      .preferredSize;
}

// class SearchAppbar extends AppBar {
//   final BuildContext context;
//   final List<String> tabLabels;
//
//   SearchAppbar({super.key, required this.context, required this.tabLabels})
//       : assert(tabLabels.isNotEmpty),
//         super(
//           toolbarHeight: 70,
//           surfaceTintColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           foregroundColor: context.colorScheme.onSurface,
//           title: AppSearchBar(),
//           bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(75),
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 35,
//                     alignment: Alignment.topCenter,
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: context.colorScheme.primary,
//                         borderRadius: const BorderRadius.vertical(
//                             bottom: Radius.circular(30))),
//                     child: TabBar(
//                       tabAlignment: TabAlignment.fill,
//                       tabs: List.generate(
//                           tabLabels.length,
//                           (i) => Tab(
//                                 iconMargin: EdgeInsets.zero,
//                                 text: tabLabels[i],
//                               )),
//                     ),
//                   ),
//                 ],
//               )),
//         );
// }

class AppSearchBar extends StatefulWidget {
  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;

  SearchBloc get bloc => context.read<SearchBloc>();

  SearchAppbarCubit get appbarCubit => context.read<SearchAppbarCubit>();

  @override
  void initState() {
    _controller = TextEditingController(text: bloc.state.keyword);
    _controller.addListener(() {
      bloc.add(SearchEditingKeyword(_controller.text));
    });
    appbarCubit.stream.listen((isEditing) {
      _controller.text = bloc.lastStateCommit.keyword;
      if (!isEditing) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        bloc: context.read<SearchBloc>(),
        builder: (context, state) {
          List<Widget> leading = (appbarCubit.isEditing)
              ? []
              : [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: context.colorScheme.onSurface,
                    onPressed: () {
                      try {
                        context.pop();
                      } catch (e) {
                        HomeRoute().push(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      width: 16,
                      thickness: 1,
                    ),
                  ),
                ];
          return SearchBar(
            hintText: "Search for address, food, drink and more",
            controller: _controller,
            leading: Row(
              children: [
                ...leading,
                Icon(
                  CupertinoIcons.search,
                  color: context.colorScheme.tertiary,
                )
              ],
            ),
            trailing: [
              IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(
                        AppIcons.locationPin,
                        color: context.colorScheme.primary,
                      ),
                      Text("Việt Nam")
                    ],
                  ))
            ],
            onTap: () {
              appbarCubit.edit();
            },
            onChanged: (keyword) {
              bloc.add(SearchEditingKeyword(keyword));
              appbarCubit.edit();
            },
            onSubmitted: (keyword) async {
              bloc.add(SearchRequest());
              await Future.delayed(100.microseconds);
              appbarCubit.submit();
            },
          );
        });
  }
}
