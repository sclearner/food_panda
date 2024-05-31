part of 'search_page.dart';

class SearchAppbar extends AppBar {
  final BuildContext context;
  final List<String> tabLabels;

  SearchAppbar({super.key, required this.context, required this.tabLabels})
      : assert(tabLabels.isNotEmpty),
        super(
          toolbarHeight: 70,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          foregroundColor: context.colorScheme.onSurface,
          title: AppSearchBar(),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 75,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: context.colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor:
                                    context.colorScheme.onSecondary),
                            icon: Icon(AppIcons.filter),
                            label: Text("Filter")),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<SearchViewCubit>().changeTo(SearchViewMode.grid);
                                }, icon: Icon(AppIcons.grid)),
                            IconButton(
                                onPressed: () {
                                  context.read<SearchViewCubit>().changeTo(SearchViewMode.list);
                                }, icon: Icon(AppIcons.list))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30))),
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
                ],
              )),
        );
}

class AppSearchBar extends StatefulWidget {
  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;

  SearchBloc get bloc => context.read<SearchBloc>();

  @override
  void initState() {
    _controller = TextEditingController(text: bloc.state.keyword);
    _controller.addListener(() {
      bloc.add(SearchEditingKeyword(_controller.text));
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
          return SearchBar(
            hintText: "Search for address, food, drink and more",
            controller: _controller,
            leading: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    try {
                      context.pop();
                    }
                    catch (e) {
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
                Icon(CupertinoIcons.search)
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
            onChanged: (keyword) {
              bloc.add(SearchEditingKeyword(keyword));
            },
            onSubmitted: (keyword) {
              SearchFoundRoute(input: keyword).pushReplacement(context);
            },
          );
        });
  }
}
