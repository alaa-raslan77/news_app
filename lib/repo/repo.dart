import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String id);
  Future<NewsDataResponse> getNewsData(
      {String? sourceID, int? pageSize, int? page});
}
