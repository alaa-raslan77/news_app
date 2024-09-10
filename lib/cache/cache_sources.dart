import 'package:hive/hive.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:path_provider/path_provider.dart';

class CacheSources {
  static Future<void> saveSources(SourcesResponse response) async {
    final directory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'Sources',
      {'sources'},
      path: directory.path,
    );
    final sourcesBox = await collection.openBox<Map>('sources');
    sourcesBox.put('sources', response.toJson());
  }

  static Future<SourcesResponse> getSources() async {
    final directory = await getApplicationDocumentsDirectory();

    final collection = await BoxCollection.open(
      'Sources',
      {'sources'},
      path: directory.path,
    );
    final sourcesBox = await collection.openBox<Map>('sources');

    final response = await sourcesBox.get('sources');
    return SourcesResponse.fromJson(response);
  }
}
