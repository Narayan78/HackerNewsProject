import 'package:dio/dio.dart';
import '../models/news_data_model.dart';


class NewsApiService {
  final Dio _dio = Dio();
  final String apiUrl;

  NewsApiService(this.apiUrl);

  Future<NewsDataModel> fetchNewsData() async {
    try {
      final response = await _dio.get(apiUrl);
      return NewsDataModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load news');
    }
  }
}
