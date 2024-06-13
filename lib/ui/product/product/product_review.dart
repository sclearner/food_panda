part of 'product_page.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  List<Widget> reviewList(BuildContext context) => List.generate(
      10,
      (index) => const Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: ReviewBar(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("REVIEW"),
              TextButton(onPressed: () {
                const ReviewRoute(productId: '1').push(context);
              }, child: const Text("See all reviews"))
            ],
          ),
        ),
        Column(children: _addDivider(reviewList(context).sublist(0, 3))),
      ],
    );
  }
}
