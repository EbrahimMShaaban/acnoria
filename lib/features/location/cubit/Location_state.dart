part of 'Location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}
class GetLocationLoadingtState extends LocationState{}
class GetLocationSuccessState extends LocationState{

  // late final LocationModel loginModel;
  // LocationSuccessState(this.loginModel);
}
class GetLocationErrorState extends LocationState{
  // final String message;
  //
  // LocationErrorState({required this.message});

}class PostLocationLoadingtState extends LocationState{}
class PostLocationSuccessState extends LocationState{

  // late final LocationModel loginModel;
  // LocationSuccessState(this.loginModel);
}
class PostLocationErrorState extends LocationState{
  // final String message;
  //
  // LocationErrorState({required this.message});

}

