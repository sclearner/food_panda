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
      "https://cdn.tgdd.vn/2021/05/CookProduct/thumbcmscn-1200x676-4.jpg"
    ]));
  }
}