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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DESCRIPTION"),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state.menu?.description == null) return CircularProgressIndicator();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text.rich(
                      TextSpan(children: [
                        ///Mô tả
                        TextSpan(
                            text: state.menu!.description ?? "No description" ),
                        ///Xem thêm
                        TextSpan(text: " View more")
                      ]),
                      textAlign: TextAlign.justify,
                    ),
                  );
                }
              ),
            ],
          ),
        )
      ],
    );
  }
}
