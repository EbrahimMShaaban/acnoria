import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../models/cart_details_model.dart';
import '../../../models/custom_item_model.dart';
import '../../../models/customproducts_model.dart';
import '../../../models/registermodel.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';
import '../view.dart';

part 'Cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  // CartModel? myCart;
  CustemItemModel? product;
  CartDetailsModel? cartDetailsModel;
  int? code;
  String? message;

  void getCart() {
    emit(GetOrderLoadingtState());
    DioHelper.getdata(url: GEDORDER, headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer ${token}",
    }, query: {
      'locale': 'ar',
    }).then((value) {
      cartDetailsModel = CartDetailsModel.fromJson(value.data);
      print(cartDetailsModel!.data!.items);
      emit(GetOrdertSuccessState());

      print("11111111111111 done");
      print(value.data["data"]);
    }).catchError((error) {
      print(error);

      print("11111111111111 ");

      emit(GetOrdertErrorState());
    });
  }

  void romoveItem(int id) {
    emit(RomoveItemFromCardLoadingtState());
    DioHelper.getdata(url: "$RomoveItemFromCard$id", headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer ${token}",
    }, query: {
      'locale': 'ar',
    }).then((value) {
      cartDetailsModel = CartDetailsModel.fromJson(value.data);
      print(cartDetailsModel!.data!.items);
      emit(RomoveItemFromCardtSuccessState());

      print("11111111111111 done");
      print(value.data["data"]);
    }).catchError((error) {
      print(error);
      print("11111111111111 ");

      emit(RomoveItemFromCardtErrorState());
    });
  }

  getAllProducts(String key) {
    print('prooooduct is ${product}');

    emit(GetAllProductstLoadingtState());

    DioHelper.getdata(url: CustomProduct + key, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    }, query: {
      'locale': 'ar',
    }).then((value) {
      product = CustemItemModel.fromJson(value.data);
      //  List<Data> list = product?.data?.length as List<Data>;
      print('prooooduct is ${value.data}');
      print('prooooduct is ${value.data}');
      //    print('prooooduct is ${list}');

      emit(GetAllProductstSuccessState());
    }).catchError((error) {
      emit(GetAllProductstErrorState());

      print('eeeeeeeeeeee${error.toString()}');
      print('prooooduct is ${product}');
    });
  }

  void AddCart({
    required int? product_id,
    required int? quantity,
    BuildContext? context,
  }) {
    emit(AddCartLoadingtState());
    DioHelper.postdata(url: "$ADDCART$product_id", headers: {
      "Accept": "application/json",
      'Authorization': "Bearer ${token}",
    }, posteddata: {
      "product_id": product_id,
      "quantity": quantity,
    }).then((value) {
      message = value.data["message"];
      message == "تم بنجاح إضافة العنصر إلى العربة"
          ? navigateTo(context, CartScreen())
          : MotionToast.error(
              description: Text("${value.data["error"]["message"]}"),
            ).show(context!);
      emit(AddCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      print("000000000000000000");
      print(product_id);
      print(quantity);
      emit(AddCartErrorState());
    });
  }

  void updateCard({
    required int? product_id,
    required int? quantity,
    BuildContext? context,
  }) {
    emit(UpdateCardtLoadingtState());
    DioHelper.putdata(url: UpdateCard, headers: {
      "Accept": "application/json",
      'Authorization': "Bearer ${token}",
    }, posteddata: {
      "qty": {"${product_id}": quantity}
    }).then((value) {
      // message = value.data["message"];
      print("000000000000000000");

      emit(UpdateCardtSuccessState());
    }).catchError((error) {
      print('issssssssssssssssssssssssssssssssssssssss ${product_id}');
    print(quantity);
      print(error.toString());

      emit(UpdateCardtErrorState());
    });
  }
}
