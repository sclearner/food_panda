part of 'product_page.dart';

class ProductMenu extends StatelessWidget {
  List<Widget> menuList(BuildContext context) => List.generate(
      10,
      (index) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: DishBar()
          ));

  List<Widget> _addDivider(List<Widget> items) {
    List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      result.add(Divider(
        height: 4,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("MENU"),
            TextButton(onPressed: () {}, child: Text("See all categories"))
          ],),
        ),
        Column(children: [
            ..._addDivider(menuList(context).sublist(0, 3)),
            TextButton(
                onPressed: () {},
                child: Center(
                    child: Text(
                  "View more",
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: context.colorScheme.onSurfaceVariant),
                )))
          ]),
      ],
    );
  }
}
