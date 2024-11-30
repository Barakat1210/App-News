import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/ArticlesResponse.dart';
import 'package:news_app/data/model/source_response/source_response.dart';
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _sourceEndpoint = '/v2/top-headlines/sources';
  static const String _articleEndpoint = '/v2/everything';
  static const String apiKey = '95661797ad47404cb06cc09e726e196f';

  static Future<SourceResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(_baseUrl, _sourceEndpoint, {
      'apiKey': apiKey,
      'category': categoryId,
    });
    http.Response serverResponse = await http.get(uri);
    var json = jsonDecode(serverResponse.body); //return json
    SourceResponse sourcesResponse = SourceResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(_baseUrl, _articleEndpoint, {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
  static Future<ArticlesResponse>searchArticle(String query)async{
    Uri url=Uri.https( _baseUrl,_articleEndpoint,{'apiKey':apiKey,'q':query});
    http.Response serverResponse=await http.get(url);
    // التحقق من حالة الاستجابة
    if (serverResponse.statusCode != 200) {
      throw Exception('Failed to search articles: ${serverResponse.statusCode}');
    }

    // فك ترميز JSON وتحويله إلى كائن ArticlesResponse
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);

    // إرجاع الكائن
    return articlesResponse;
  }
}