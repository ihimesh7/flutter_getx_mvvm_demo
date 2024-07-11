import 'package:dio/dio.dart';
import 'package:getx_mvvm_demo/Model/cat.dart';

class CatApiService {
  static const String baseURL = 'https://api.thecatapi.com/v1/images/search';
  static const String apiKey = 'live_8BAODyFjRGLC10b6VR9h9Syw4z86L8iszaPmWstKdqyqI78EiKb53cwqqbv0qkUG';

  Future<Cat> getRandomCat() async {
    final dio = Dio();
    dio.options.headers = {'X-API-KEY': apiKey};

    final response = await dio.get(baseURL);

    if (response.statusCode == 200) {
      final data = response.data as List;
      if (data.isNotEmpty) {
        return Cat.fromJson(data[0]);
      } else {
        throw Exception('No cats found');
      }
    } else {
      throw Exception('Failed to load cat images');
    }
  }
}