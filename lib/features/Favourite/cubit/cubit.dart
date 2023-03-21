import 'package:acnoria/features/Favourite/cubit/state.dart';

import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/allFavorites_model.dart';
import '../../../models/fav_model/test.dart';

class FavouritesCubit extends Cubit<FavouritesStates> {
  FavouritesCubit() : super(FavouritesInitialStates());

  static FavouritesCubit? get(context) => BlocProvider.of(context);

  AllFavouritesModel? allFavouritesModel;

  void getAllfavourites() {
    //   print('prooooduct is ${product?.data?.length}');

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
      print("name  in modelllll is :${allFavouritesModel?.data![1].product?.name!}");
      // List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is .data}');
       print('prooooduct is ${value.data}');



      emit(FavouritesSuccessState());
    }).catchError((error) {
      emit(FavouritesErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${allFavouritesModel?.data?.length}');
    });
  }
}
