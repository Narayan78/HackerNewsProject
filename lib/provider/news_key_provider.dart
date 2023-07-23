import 'package:flutter/material.dart';
import '../models/news_data_model.dart';
import '../services/news_api_service.dart';




class NewsProvider with ChangeNotifier {
  NewsDataModel? _newsData;
  bool _isLoading = false;

  NewsDataModel? get newsData => _newsData;
  bool get isLoading => _isLoading;

  Future<void> fetchNewsData() async {
    if (_newsData == null && !_isLoading) {
      _isLoading = true;
      notifyListeners();

      final newsApiService =
          NewsApiService('https://hacker-news.firebaseio.com/v0/item/36801448.json?print=pretty');
      try {
        _newsData = await newsApiService.fetchNewsData();
        _isLoading = false;
        notifyListeners();
      } catch (error) {
        _isLoading = false;
        // Handle error here
      }
    }
  }
}
