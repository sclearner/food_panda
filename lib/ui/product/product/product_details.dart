part of 'product_page.dart';

class ProductScreenDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ProductDetail(
          height: 100,
          titleStyle: context.textTheme.headlineLarge,
          descriptionStyle: context.textTheme.titleSmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("OPEN IN"),
                Text("24/7"),
              ],
            ),
            FilledButton(
                style: FilledButton.styleFrom(minimumSize: Size.zero, fixedSize: const Size.fromHeight(33), padding: EdgeInsets.symmetric(horizontal: 10), shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 5),
                    Text("Contact"),
                  ],
                ))
          ],
        )
      ],
    );
  }
}