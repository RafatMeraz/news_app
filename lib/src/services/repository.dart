import 'package:news_app/src/models/all_data_model.dart';
import 'package:news_app/src/models/news_model.dart';
import 'package:news_app/src/services/news_api_services/news_api_services.dart';

class _Repository {
  Future<NewsModel> get getAllHeadline => NewsAPIServices.getTopHeadline();
  Future<NewsModel> searchNews(String query) => NewsAPIServices.getEveryThingSearchNews(query);
  Future<AllData> getAllData() => NewsAPIServices.getAllData();
}
final repository = _Repository();