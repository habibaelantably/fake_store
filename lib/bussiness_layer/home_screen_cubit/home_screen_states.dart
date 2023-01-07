
class HomeScreenStates {}

class InitialHomeScreenState extends HomeScreenStates{}

class GetHomeDataLoadingState extends HomeScreenStates {}

class GetHomeDataSuccessState extends HomeScreenStates {}

class GetHomeDataErrorState extends HomeScreenStates {

  final String errorMessage;
  GetHomeDataErrorState( this.errorMessage);
}

