import 'package:hive/hive.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:path_provider/path_provider.dart';

class CacheNewsData {
  static Future<void> saveNewsData(NewsDataResponse response) async {
    final directory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'newsData'},
      path: directory.path,
    );
    final newsDataBox = await collection.openBox<Map>('newsData');
    newsDataBox.put('newsData', response.toJson());
  }

  static Future<NewsDataResponse> getNewsData() async {
    final directory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'NewsData',
      {'newsData'},
      path: directory.path,
    );
    final newsDataBox = await collection.openBox<Map>('newsData');

    final response = await newsDataBox.get('newsData');
    return NewsDataResponse.fromJson(response);
  }
}
