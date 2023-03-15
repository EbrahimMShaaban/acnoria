import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../models/registermodel.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';
import 'States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit? get(context) => BlocProvider.of(context);
  RegisterModrl? loginModel;

  final formKey = GlobalKey<FormState>();

  void userLogin({
    required String? email,
    required String? password,
  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(LoginLoadingtState());
    // formKey.currentState!.save();
    DioHelper.postdata(url: LOGIN,

        headers: {
      "Accept": "application/json"
    }, query: {
      "token": "true"
    }, posteddata: {
      "email": email,
      "password": password,
    }).then((value) {
      emit(LoginSuccessState());
      loginModel = RegisterModrl.fromJson(value.data);
      print("1111111111111111111111111111done");
      print(loginModel?.message);
      print(loginModel?.token);
    }).catchError((error) {
      emit(LoginErrorState(message: error.toString()));
      print(error.toString());
      print("11111111111111111111111111111");
      print(email);
      print(password); print(loginModel?.message);
      print("11111111111111111111111111111");
    });
  }
}
