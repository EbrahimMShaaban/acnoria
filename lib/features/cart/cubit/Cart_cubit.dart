import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/custom_item_model.dart';
import '../../../models/customproducts_model.dart';
import '../../../models/registermodel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

part 'Cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  // CartModel? myCart;
  CustemItemModel? product;

  void getCart() {
    emit(GetOrderLoadingtState());
    DioHelper.getdata(
      url: GEDORDER,
      headers: {
        'Accept': 'application/json',
        'Cookie': 'bagisto_session=key',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      // myCart = CartModel.fromJson(value.data);
   print(value!.data?["id"]);
   print(value!.data?["items"]);
   print(value!.data?["grand_total"]);

      emit(GetOrdertSuccessState());

       print("11111111111111 done");
      print(value.data["data"]);
    }).catchError((error) {
      print(error);
      print("00000000000000000000000ddddddddddddddddddddddd000000");
      emit(GetOrdertErrorState());
    });
  }



  getAllProducts(String key) {
    print('prooooduct is ${product}');

    emit(AddCartLoadingtState());

    DioHelper.getdata(
        url:  CustomProduct+key,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        query: {
          'locale' : 'ar',
        }
    ).then((value) {
      product = CustemItemModel.fromJson(value.data);
      //  List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is ${value.data}');
      print('prooooduct is ${value.data}');
      //    print('prooooduct is ${list}');


      emit(AddCartSuccessState());
    }).catchError((error) {
      emit(AddCartErrorState());

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${product}');
    });
  }


  // final formKey = GlobalKey<FormState>();

  void AddCart({
    required int? product_id,
    required int? quantity,

  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(AddCartLoadingtState());
    // formKey.currentState!.save();
    DioHelper.postdata(url: ADDCART+"${product_id}", headers: {
      "Accept": "application/json",
      'Authorization': "Bearer ${token}",

    },

      posteddata: {
        "product_id": product_id,
        "quantity": quantity,
      }).then((value) {
        emit(AddCartSuccessState());
      print("1111111111111111111111111111done");
      print(product_id);
      print(quantity);


    }).catchError((error) {
      print(error.toString());
      print("000000000000000000");
      print(product_id);
      print(quantity);
      emit(AddCartErrorState());
    });
  }
}
