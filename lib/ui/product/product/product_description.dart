part of 'product_page.dart';

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ///Bản đồ
        Container(
            color: AppColors.viettelRed, height: 200, width: double.infinity),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DESCRIPTION"),
              Text.rich(
                TextSpan(children: [
                  ///Mô tả
                  TextSpan(
                      text:
                          "Food is scrumptious, delicious, delectable, luscious, great tasting, much more than tasty, really appetizing, lip-smacking; the kind of food to have you licking your lips in anticipation. This is the word everyone wants to hear when bringing food to the table. Yummy food is never unpalatable, plain tasting, distasteful or disgusting."),
                  TextSpan(text: " "),

                  ///Xem thêm
                  TextSpan(text: "View more")
                ]),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        )
      ],
    );
  }
}
