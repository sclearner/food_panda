part of 'book_page.dart';

class BookMenu extends StatelessWidget {
  final List<Widget> bookList = List.generate(
      10,
      (index) => Padding(
            padding: const EdgeInsets.fromLTRB(24,10,24,0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.tgdd.vn/Files/2021/09/14/1382544/lau-sukiyaki-la-gi-tim-hieu-cach-nau-lau-sukiyaki-nhat-ban-202201031105547812.jpg'))),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Viettel Hot Pot"), Text("\$100.00")],
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
      result.add(Divider());
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        ..._addDivider(bookList.sublist(0, 3)),
        TextButton(onPressed: () {}, child: Center(child: Text("View more")))
      ]),
    );
  }
}
