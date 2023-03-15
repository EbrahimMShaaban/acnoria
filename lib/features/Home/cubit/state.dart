abstract class HomeStates {}

class HomeInitialStates extends HomeStates {}

class HomeLoadingtState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  //
  // late final UserModel loginModel;
  // HomeSuccessState(this.loginModel);
}

class HomeErrorState extends HomeStates {
  final String? message;

  HomeErrorState({required this.message});

}