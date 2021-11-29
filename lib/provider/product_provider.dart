import 'package:flutter/material.dart';
import 'package:provider_nz_club/models/product_model.dart';
import 'package:provider_nz_club/service/web_service.dart';

class AppProvider extends ChangeNotifier {
  final AppWebService appWebService = AppWebService();
  List<VideoProduct> productList = [];

  Future<void> getProduct() async {
    productList = await appWebService.getData();
    notifyListeners();
  }
}
