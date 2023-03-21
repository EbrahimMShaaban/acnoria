

import 'package:acnoria/features/Favourite/cubit/state.dart';
import 'package:acnoria/models/addFav_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/allFavorites_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  FavouritesCubit() : super(FavouritesInitialStates());

  static FavouritesCubit? get(context) => BlocProvider.of(context);

  AllFavouritesModel? allFavouritesModel;
  AddFavouriteModel? addFavouriteModel;

  getAllfavourites() {

    emit(FavouritesLoadingtState());

    DioHelper.getdata(
        url:  AllFavourites,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },


    ).then((value) {

      allFavouritesModel = AllFavouritesModel.fromJson(value.data);
      print("dataaaaa in cubit is ${value.data}");
      emit(FavouritesSuccessState( allFavouritesModel!));
      //  print('prooooduct is ${value.data}');


    //  emit(FavouritesSuccessState());

    }).catchError((error) {

      emit(FavouritesErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');

    });
  }

  addFavourite(int id){
   emit(FavouritesAddLoadingtState());
    DioHelper.getdata(url:"$AddFavourites$id",

      headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
      },
      query: {
      "product_id":id
      }
    ).then((value){

      addFavouriteModel = AddFavouriteModel.fromJson(value.data);
       emit(FavouritesAddSuccessState( AddFavouriteModel.fromJson(value.data)!));
      // if (addFavouriteModel?.data!=null){
      //   emit(FavouritesAddSuccessState());
      //
      // }

    }).catchError((error) {
      emit(FavouritesAddErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');
      //print('prooooduct is ${allFavouritesModel?.data?.length}');
    });



  }

}
