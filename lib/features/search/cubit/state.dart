abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}

class SearchLoadingtState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  //
  // late final UserModel loginModel;
  // SearchSuccessState(this.loginModel);
}

class SearchErrorState extends SearchStates {
  final String? message;

  SearchErrorState({required this.message});

}