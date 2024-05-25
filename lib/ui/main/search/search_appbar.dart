part of 'search_page.dart';

class SearchAppbar extends SliverAppBar {
  final BuildContext context;
  final List<String> tabLabels;

  SearchAppbar({super.key, required this.context, required this.tabLabels})
      : assert(tabLabels.isNotEmpty),
        super(
          toolbarHeight: 90,
          pinned: true,
          automaticallyImplyLeading: false,
          foregroundColor: context.colorScheme.onSurface,
          title: SearchBar(
              hintText: "Search for address, food, drink and more",
              leading: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10,
                    child: VerticalDivider(
                      width: 16,
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
              ]),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(95),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 95,
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
                                onPressed: () {}, icon: Icon(AppIcons.grid)),
                            IconButton(
                                onPressed: () {}, icon: Icon(AppIcons.list))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.topCenter,
                    transform: Matrix4.translationValues(0, -0.5, 0),
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30))),
                    child: TabBar(
                      tabAlignment: TabAlignment.center,
                      isScrollable: true,
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
