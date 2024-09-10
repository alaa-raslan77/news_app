import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/repo/repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitState());
  SourcesResponse? sourcesResponse;
  NewsDataResponse? model;
  List<Sources> sources = [];
  int selectedTabIndex = 0;
  int page = 1;
  int pageSize = 20;

  addNumPage(int page) {
    page++;
    emit(PageSizeUp());
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getSources(String id) async {
    try {
      emit(HomeGetSourcesLoadingState());

      sourcesResponse = await repo.getSources(id);
      emit(HomeGetSourcesSuccessState());
      getNewsData(
          sourceID: sourcesResponse?.sources?[selectedTabIndex].id ?? "");
    } catch (e) {
      emit(HomeGetSourcesErrorState());
    }
  }

  Future<void> getNewsData({String? sourceID, int? pageSize, int? page}) async {
    try {
      emit(HomeGetNewsDataLoadingState());

      model = await repo.getNewsData(
          sourceID: sourceID, page: page, pageSize: pageSize);
      emit(HomeGetNewsDataSuccessState());
    } catch (e) {
      emit(HomeGetNewsDataErrorState());
    }
  }

  changeSource(int value) {
    selectedTabIndex = value;
    emit(HomeChangeSource());
  }
}
