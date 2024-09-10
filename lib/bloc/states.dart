abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeGetSourcesLoadingState extends HomeState {}

class HomeGetSourcesSuccessState extends HomeState {}

class HomeGetSourcesErrorState extends HomeState {}

class HomeGetNewsDataLoadingState extends HomeState {}

class HomeGetNewsDataSuccessState extends HomeState {}

class HomeGetNewsDataErrorState extends HomeState {}

class HomeChangeSource extends HomeState {}

class PageSizeUp extends HomeState {}
