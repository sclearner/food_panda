import 'dart:io';

import 'package:flutter/services.dart';
import 'package:food_panda/models/menu.dart';

class ProductRepo {
  const ProductRepo();

  Future<Menu> getMenuById(String id) async {
    await Future.delayed(const Duration(seconds: 3));
    return await getMoreInfo(Menu.test);
  }

  Future<Menu> getMoreInfo(Menu menu) async {
    await Future.delayed(const Duration(seconds: 3));
    menu.description = await rootBundle.loadString('assets/sample/menu_description_sample.txt');
    menu.longitude = 105.802345;
    menu.latitude = 21.004832;
    menu.openTime = DateTime.parse("10:00");
    menu.closeTime = DateTime.parse("13:00");
    return menu;
  }
}