import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/cache/cache_news_data.dart';
import 'package:news_app/cache/cache_sources.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/repo/repo.dart';
import 'package:news_app/utils/constants.dart';

class HomeRemoteDsImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(
      {String? sourceID, int? pageSize, int? page}) async {
    Uri url = Uri.https(Constants.baseUrl, "/v2/everything", {
      "Sources": sourceID,
      "pageSize": pageSize.toString(),
      "page": page.toString()
    });
    http.Response response = await http.get(url, headers: {
      "x-api-Key": Constants.apiKey,
    });
    var json = jsonDecode(response.body);
    NewsDataResponse model = NewsDataResponse.fromJson(json);
    await CacheNewsData.saveNewsData(model);
    return model;
  }

  @override
  Future<SourcesResponse> getSources(String id) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(Constants.baseUrl, "/v2/top-headlines/sources", {
      "apiKey": Constants.apiKey, "category": id,
      // "language":"en"
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    await CacheSources.saveSources(sourcesResponse);
    return sourcesResponse;
  }
}
