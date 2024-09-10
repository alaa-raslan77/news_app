import 'package:news_app/cache/cache_news_data.dart';
import 'package:news_app/cache/cache_sources.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/repo/repo.dart';

class HomeLocalDsImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(
      {String? sourceID, int? pageSize, int? page}) async {
    NewsDataResponse response = await CacheNewsData.getNewsData();
    return response;
  }

  @override
  Future<SourcesResponse> getSources(String id) async {
    SourcesResponse response = await CacheSources.getSources();

    return response;
  }
}
