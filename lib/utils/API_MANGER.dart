import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/utils/constants.dart';

class apiManger {
  static Future<NewsDataResponse> getSearch(String query) async {
    Uri url = Uri.https(Constants.baseUrl, "/v2/everything", {"q": query});
    http.Response response = await http.get(url, headers: {
      "x-api-Key": Constants.apiKey,
    });
    var json = jsonDecode(response.body);
    NewsDataResponse model = NewsDataResponse.fromJson(json);

    return model;
  }
}
