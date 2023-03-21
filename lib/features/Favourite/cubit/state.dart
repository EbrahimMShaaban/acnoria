import 'package:acnoria/models/allFavorites_model.dart';

import '../../../models/addFav_model.dart';

abstract class FavouritesStates {}

class FavouritesInitialStates extends FavouritesStates {}

class FavouritesLoadingtState extends FavouritesStates {}
class FavouritesAddLoadingtState extends FavouritesStates {}

class FavouritesSuccessState extends FavouritesStates {
  final AllFavouritesModel  allFavouritesModel ;

  FavouritesSuccessState(this.allFavouritesModel);
}
class FavouritesAddSuccessState extends FavouritesStates {
  final AddFavouriteModel  addFavouriteModel ;

  FavouritesAddSuccessState(this.addFavouriteModel);
}

class FavouritesErrorState extends FavouritesStates {
  final String? message;

  FavouritesErrorState({required this.message});

}class FavouritesAddErrorState extends FavouritesStates {
  final String? message;

  FavouritesAddErrorState({required this.message});

}