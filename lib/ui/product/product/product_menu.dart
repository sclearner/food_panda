part of 'product_page.dart';

class ProductMenu extends StatelessWidget {
  const ProductMenu({super.key});

  List<Widget> menuList(BuildContext context) => List.generate(
      10,
      (index) => const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: DishBar()
          ));

  List<Widget> _addDivider(List<Widget> items) {
    List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      result.add(const Divider(
        height: 4,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text("MENU"),
            TextButton(onPressed: () {}, child: const Text("See all categories"))
          ],),
        ),
        Column(children: [
            ..._addDivider(menuList(context).sublist(0, 3)),
            TextButton(
                onPressed: () {
                  const CategoriesRoute(productId: '1').push(context);
                },
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
