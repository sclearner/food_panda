part of 'book_page.dart';

class BookMenu extends StatelessWidget {
  const BookMenu({super.key});

  List<Widget> bookList(BuildContext context) => List.generate(
      10,
      (index) => Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.tgdd.vn/Files/2021/09/14/1382544/lau-sukiyaki-la-gi-tim-hieu-cach-nau-lau-sukiyaki-nhat-ban-202201031105547812.jpg'))),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Viettel Hot Pot",
                        style: context.textTheme.labelMedium,
                      ),
                      Text(
                        "\$100.00",
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: context.colorScheme.onSurfaceVariant),
                      )
                    ],
                  ),
                )),
                Checkbox(value: true, onChanged: (_) {})
              ],
            ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        ..._addDivider(bookList(context).sublist(0, 3)),
        TextButton(
            onPressed: () {},
            child: Center(
                child: Text(
              "View more",
              style: context.textTheme.titleSmall
                  ?.copyWith(color: context.colorScheme.onSurfaceVariant),
            )))
      ]),
    );
  }
}
