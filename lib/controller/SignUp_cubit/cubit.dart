import 'package:acnoria/models/registermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit? get(context) => BlocProvider.of(context);
  late  RegisterModrl registerModrl;
  //final formKey = GlobalKey<FormState>();//

  void userRegister({
    required String? first_name,
    required String? last_name,
    required String? email,
    required String? password,
    required String? password_confirmation,
  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(RegisterLoadingtState());
    DioHelper.postdata(url: REGISTER, posteddata: {
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "password": password,
      "password_confirmation": password
    }).then((value) {
      registerModrl = RegisterModrl.fromJson(value.data);
      // registerModrl?.message=value.data["message"];
      emit(RegisterSuccessState());
      print("1111111111111111111111111111done");
      // print(registerModrl?.message);

    }).catchError((error) {
      emit(RegisterErrorState());
      print(error.toString());
      print(error);
      print("11111111111111111111111111111");
      print(password);
      print(email);
      print(first_name);
      print(last_name);
    });
  }
}
