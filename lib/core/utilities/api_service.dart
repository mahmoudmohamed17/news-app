import 'package:dio/dio.dart';

class Apiservice {
  final _dio = Dio();
  final apiKey = '1457ae8a24404282a738440401652650';
  Future<Map<String, dynamic>> getHeadlineNews({required String category}) async {
    var response = await _dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category');
    return response.data;
  }
}
