import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_data_model.dart';
import '../provider/news_key_provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    if (!newsProvider.isLoading && newsProvider.newsData == null) {
      // Fetch data only once when the widget is first built
      newsProvider.fetchNewsData();
    }



    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: newsProvider.isLoading
          ?const  Center(child: CircularProgressIndicator())
          : newsProvider.newsData != null
              ? NewsDetails(newsProvider.newsData!)
              : const Center(child: Text('No data available')),
    );
  }
}

class NewsDetails extends StatelessWidget {
  final NewsDataModel newsData;

  NewsDetails(this.newsData);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text('Title: ${newsData.title}'),
        Text('By: ${newsData.by}'),
        Text('Score: ${newsData.score}'),
        Text('Time: ${DateTime.fromMillisecondsSinceEpoch(newsData.time * 1000)}'),
        Text('URL: ${newsData.url}'),
      ],
    );
  }
}
