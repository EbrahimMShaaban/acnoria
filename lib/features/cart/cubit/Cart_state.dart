part of 'Cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class AddCartLoadingtState extends CartState{}
class AddCartSuccessState extends CartState{

  // late final CartModel loginModel;
  // CartSuccessState(this.loginModel);
}
class AddCartErrorState extends CartState{
  // final String message;
  //
  // CartErrorState({required this.message});

}class UpdateCardtLoadingtState extends CartState{}
class UpdateCardtSuccessState extends CartState{

  // late final CartModel loginModel;
  // CartSuccessState(this.loginModel);
}
class UpdateCardtErrorState extends CartState{
  // final String message;
  //
  // CartErrorState({required this.message});

}




class GetAllProductstLoadingtState extends CartState{}
class GetAllProductstSuccessState extends CartState{

  // late final CartModel loginModel;
  // CartSuccessState(this.loginModel);
}
class GetAllProductstErrorState extends CartState{
  //

  // CartErrorState({required this.message});

}



class GetOrderLoadingtState extends CartState{}
class GetOrdertSuccessState extends CartState{

  // late final CartModel loginModel;
  // CartSuccessState(this.loginModel);
}
class GetOrdertErrorState extends CartState{
  // final String message;
  //
  // CartErrorState({required this.message});

}
class RomoveItemFromCardLoadingtState extends CartState{}
class RomoveItemFromCardtSuccessState extends CartState{

  // late final CartModel loginModel;
  // CartSuccessState(this.loginModel);
}
class RomoveItemFromCardtErrorState extends CartState{
  // final String message;
  //
  // CartErrorState({required this.message});

}

