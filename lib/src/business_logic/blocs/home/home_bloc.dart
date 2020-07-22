import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/home/home_events.dart';
import 'package:news_app/src/business_logic/blocs/home/home_states.dart';
import 'package:news_app/src/services/news_api_services/news_api_services.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    if (event is HomeGetAllHeadlineEvent) {
      yield HomeNewsLoadingState();
      try {
        var _response = await NewsAPIServices.getTopHeadline();
        yield HomeNewsFetchedSuccessState(newsModel: _response);
      } catch (error){
        yield HomeNewsErrorState();
      }
    }
  }

}