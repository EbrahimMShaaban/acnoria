import 'package:acnoria/models/fav_model/test.dart';

abstract class FavouritesStates {}

class FavouritesInitialStates extends FavouritesStates {}

class FavouritesLoadingtState extends FavouritesStates {}

class FavouritesSuccessState extends FavouritesStates {
  final AllFavouritesModel  allFavouritesModel ;

  FavouritesSuccessState(this.allFavouritesModel);
}

class FavouritesErrorState extends FavouritesStates {
  final String? message;

  FavouritesErrorState({required this.message});

}