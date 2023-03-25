import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/Categories/cubit/state.dart';
import 'package:acnoria/features/search/cubit/state.dart';
import 'package:acnoria/models/product_model.dart';
import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../models/categories_model.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialStates());

  static CategoriesCubit? get(context) => BlocProvider.of(context);

  int selectedIndex = -1;
  chngeSelection(int index){
    selectedIndex = index;

    // x =!x ;
    // x =isSeelcted! ;
    // print('is cubit = $x');
    // print('is selectt = $isSeelcted');
  }

  CategoriesModel? categoriesModel;

  getAllCatefories([void Function(int id)? onGetCategories]) {
    print('categoriesModel is ${categoriesModel?.data?.length}');

    emit(CategoriesLoadingtState());

    DioHelper.getdata(
      url:  AllCategories,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      query: {
        'locale' : 'ar'
      }
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      if(onGetCategories != null) {
        onGetCategories((categoriesModel!.data ?? []).first.id ?? 0);
      }
      print('categoriesModel is ${value.data}');
      print('categoriesModel is ${value.data}');
    //  print('prooooduct is ${list}');


      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState(message: error.toString()));

      print('categoriesModel${error.toString()}');
      print('categoriesModel is ${categoriesModel?.data?.length}');
    });
  }
}
