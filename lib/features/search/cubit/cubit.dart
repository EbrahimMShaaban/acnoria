import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/search/cubit/state.dart';
import 'package:acnoria/models/product_model.dart';
import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../models/customproducts_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit? get(context) => BlocProvider.of(context);

  CustomProductsModel? product;

  getAllProducts() {
    print('prooooduct is ${product?.data?.length}');

    emit(SearchLoadingtState());

    DioHelper.getdata(
      url:  AllProducts,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    ).then((value) {
      product = CustomProductsModel.fromJson(value.data);
    //  List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is ${value.data}');
      print('prooooduct is ${value.data}');
  //    print('prooooduct is ${list}');


      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${product?.data?.length}');
    });
  }
}
