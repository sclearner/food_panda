part of 'product_page.dart';

class ProductScreenDetails extends StatelessWidget {
  const ProductScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          return ProductDetail(
            height: 100,
            menu: state.menu,
            titleStyle: context.textTheme.headlineLarge,
            descriptionStyle: context.textTheme.titleSmall,
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("OPEN IN"),
                Text("24/7"),
              ],
            ),
            FilledButton(
                style: FilledButton.styleFrom(
                    minimumSize: Size.zero,
                    fixedSize: const Size.fromHeight(33),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: const Row(
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
