part of 'search_page.dart';

class SearchAppbar extends SliverAppBar {
  final BuildContext context;

  SearchAppbar({super.key, required this.context})
      : super(
          toolbarHeight: 90,
          pinned: true,
          title: SearchBar(),
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
                            icon: Icon(Icons.filter_alt),
                            label: Text("Filter")),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.grid_view_rounded)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.messenger))
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
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: List.generate(
                          10,
                          (index) => Tab(
                                iconMargin: EdgeInsets.zero,
                                text: 'Tab $index',
                              )),
                    ),
                  ),
                ],
              )),
          backgroundColor: context.colorScheme.primary,
        );
}
