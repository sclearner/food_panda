part of 'product_page.dart';

class ProductDescription extends StatelessWidget {
  bool _isFull = false;
  final int _lengthLimit = 200;

  link(lat, long) => 'https://maps.google.com/maps?q=$lat,$long';
  //
  // controller(double lat, double long) =>
  //     WebViewController()
  //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //       ..setBackgroundColor(const Color(0x00000000))
  //       ..setNavigationDelegate(
  //         NavigationDelegate(
  //             onProgress: (int progress) {
  //               // Update loading bar.
  //             },
  //             onPageStarted: (String url) {},
  //           onPageFinished: (String url) {},
  //           onWebResourceError: (WebResourceError error) {},
  //           onNavigationRequest: (NavigationRequest request) {
  //             if (request.url.startsWith('https://www.youtube.com/')) {
  //               return NavigationDecision.prevent;
  //             }
  //             return NavigationDecision.navigate;
  //           },
  //         ),
  //       )
  //       ..loadRequest(Uri.parse(link(lat, long)));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Bản đồ
        Container(
          color: AppColors.viettelRed,
          height: 200,
          width: double.infinity,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state.menu?.latitude == null) return SizedBox();
              final position =
                  LatLng(state.menu!.latitude!, state.menu!.longitude!);
              return FlutterMap(
                  options: MapOptions(initialCenter: position),
                  mapController: MapController(),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.foodpanda.food_panda',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                          point: position,
                          child: const Icon(Icons.location_pin,
                              color: AppColors.viettelRed),
                          alignment: Alignment.center)
                    ]),

                  ]);
              // return WebViewWidget(controller: controller(
              //     state.menu!.latitude!, state.menu!.longitude!));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("DESCRIPTION"),
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
                if (state.menu?.description == null)
                  return Center(child: CircularProgressIndicator());
                if (state.menu!.description!.length <= _lengthLimit)
                  _isFull = true;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: StatefulBuilder(builder: (context, setState) {
                    return Text.rich(
                      TextSpan(children: [
                        ///Mô tả
                        TextSpan(
                            text: _getDescription(state.menu!.description!)),

                        ///Xem thêm
                        ((state.menu!.description ?? "").length >= _lengthLimit)
                            ? TextSpan(
                                text: (_isFull) ? "View less" : "View more",
                                style: TextStyle(
                                  color: context.colorScheme.primary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      _isFull = !_isFull;
                                    });
                                  })
                            : const TextSpan(text: "")
                      ]),
                      textAlign: TextAlign.justify,
                    );
                  }),
                );
              }),
            ],
          ),
        )
      ],
    );
  }

  String _getDescription(String content) {
    if (content.length <= _lengthLimit) return content.trim();
    if (_isFull) return "${content.trim()} ";
    return "${content.substring(0, content.substring(0, _lengthLimit).lastIndexOf(' '))} ";
  }
}
