import 'package:acnoria/features/Home/cubit/state.dart';

import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/customproducts_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit? get(context) => BlocProvider.of(context);

  CustomProductsModel? product;

  getAllProducts({required int id,bool isnew= false,}) {
 //   print('prooooduct is ${product?.data?.length}');

    emit(HomeLoadingtState());

    DioHelper.getdata(
      url:  AllCustomProducts,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      query: {
        'new': isnew,
        'category_id':id,
        'locale':"ar"
      }

    ).then((value) {
      product = CustomProductsModel.fromJson(value.data);
     // List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is ${value.data}');
      print('prooooduct is ${value.data}');



      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(message: error.toString()));

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${product?.data?.length}');
    });
  }
}
