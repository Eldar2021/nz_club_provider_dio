import 'package:provider_nz_club/models/product_model.dart';
import 'package:dio/dio.dart';

class AppWebService {
  final Dio dio = Dio();
  Future<List<VideoProduct>> getData() async {
    try {
      final response = await dio.get('http://95.179.187.55/api/video/products/list/258');
      return VideoProduct.fromList(response.data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
