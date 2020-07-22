import 'package:news_app/src/models/news_model.dart';
import 'package:news_app/src/services/news_api_services/news_api_services.dart';

import 'firebase_services/auth_services.dart';

class _Repository {
  Future<NewsModel> get getAllHeadline => NewsAPIServices.getTopHeadline();
}
final repository = _Repository();