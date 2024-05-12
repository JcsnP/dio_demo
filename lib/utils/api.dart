import 'package:dio/dio.dart';
import 'package:dio_demo/models/cat_fact_model.dart';

class Api {
  final Dio _dio = Dio();

  final _baseUrl = 'https://catfact.ninja';

  Future<CatFact?> getCatFact() async {
    CatFact? fact;
    try {
      Response response = await _dio.get(_baseUrl + '/fact');
      fact = CatFact.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    }
    return fact;
  }
}
