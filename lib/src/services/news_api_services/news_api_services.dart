import 'dart:convert';

import 'package:news_app/src/models/news_model.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://newsapi.org/v2/";
const API_KEY = "62bb1d14ea3d45f78157cd5af17dc9e5";

class NewsAPIServices {
  static http.Client _client = http.Client();
  static String country = "us";
  static String language = "en";

  static Future<NewsModel> getTopHeadline() async{
    try {
      var _response = await _client.get("https://newsapi.org/v2/top-headlines?country=$country&apiKey="+API_KEY);
      if (_response.statusCode == 200){
        return NewsModel.fromJson(jsonDecode(_response.body));
      } else {
        throw Exception('Something went wrong!');
      }
    } catch (_){
      throw Exception('Something went wrong!');
    }
  }
}