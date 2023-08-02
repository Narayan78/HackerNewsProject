import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/story_data.dart';

final story =FutureProvider.family((ref, String storyType) => StoryServices.getStoryId(storyType: storyType));

class StoryServices {
  static Dio dio = Dio();

  static Future<List<StoryData>> getStoryId({required String storyType}) async {

    try {
      final response = await dio.get('https://hacker-news.firebaseio.com/v0/$storyType.json');
      final storyIds = (response.data as List).take(15).toList();
      List<StoryData> stories = [];

      for(final storyId in storyIds){
        final storyResponse = await dio.get('https://hacker-news.firebaseio.com/v0/item/$storyId.json');
        final storyData = storyResponse.data;
        final story = StoryData(
            by: storyData['by']??'',
            id: storyData['id']??'',
            kids: List<int>.from(storyData['kids'] ?? []),
            title: storyData['title']??'',
            text: storyData['text'] ?? '',
        );
        stories.add(story);
        }

      return stories;
    } catch    (err) {
       rethrow ;
    }
  }

}
