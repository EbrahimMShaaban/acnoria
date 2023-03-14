import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/Home/cubit/state.dart';
import 'package:acnoria/features/search/cubit/state.dart';
import 'package:acnoria/models/product_model.dart';
import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit? get(context) => BlocProvider.of(context);

  Product? product;

  getAllCatefories(bool isnew) {
    print('prooooduct is ${product?.data?.length}');

    emit(HomeLoadingtState());

    DioHelper.getdata(
      url:  AllCategories,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      query: {
        'new': isnew
      }

    ).then((value) {
      product = Product.fromJson(value.data);
      List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is ${value.data}');
      print('prooooduct is ${value.data}');
      print('prooooduct is ${list}');


      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${product?.data?.length}');
    });
  }
}
