import 'dart:async';

import 'package:food_panda/models/menu.dart';
import 'package:uuid/uuid.dart';

class SearchRepo {
  String? keyword;

  Future<List<Menu>> search(String input, {int offset = 0, int limit = 10}) async {
    await Future.delayed(const Duration(milliseconds: 5000));
    return List.generate(limit, (index) => Menu(id: Uuid().v4(), title: "Thực đơn Viettel số $index", subtitle: "Hãy thưởng thức thực đơn số $index theo cách của bạn", gallery: [
      "https://cdn.alongwalk.info/vn/wp-content/uploads/2023/06/30204105/image-dat-xat-ra-mieng-mon-long-xe-dieu-gion-ngon-la-mieng-khien-dan-tinh-dua-nhau-an-thu-tai-tiem-long-xe-dieu-sai-gon-b2a8b72ac92f70ef171ddc6272ad8fbb.jpg",
      "https://beptruong.edu.vn/wp-content/uploads/2013/01/suon-nuong-muoi-ot.jpg",
      "https://i-giadinh.vnecdn.net/2022/11/03/Thanh-pham-1-1-5009-1667468527.jpg",
      "https://cdn.tgdd.vn/2021/05/CookProduct/thumbcmscn-1200x676-4.jpg",
      "https://images.baoangiang.com.vn/image/fckeditor/upload/2024/20240116/images/uong-bia-2-511.jpg",
      "https://www.vinmec.com/s3-images/20210317_143609_055773_sushi.max-800x800.jpg",
      "https://www.vanhoanggroup.com/Portals/28054/Vanhoanggoup/Bai%202%20Bo%20bit%20tet%20dat%20vang%201.jpg",
      "https://cdn.alongwalk.info/vn/wp-content/uploads/2022/03/03215707/image-pho-choc-troi-va-loat-to-pho-co-gia-dat-nhat-the-gioi-164629422672300.jpg",
      "https://cafebiz.cafebizcdn.vn/162123310254002176/2024/1/26/5-1706257921515-1706257921622755027597.png"
    ]));
  }
}