abstract class CategoriesStates {}

class CategoriesInitialStates extends CategoriesStates {}

class CategoriesLoadingtState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  //
  // late final UserModel loginModel;
  // CategoriesSuccessState(this.loginModel);
}

class CategoriesErrorState extends CategoriesStates {
  final String? message;

  CategoriesErrorState({required this.message});

}