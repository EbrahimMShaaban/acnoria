import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/registermodel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilInitial());

  static ProfilCubit get(context) => BlocProvider.of(context);

  RegisterModrl? myProfil;

  void getProfil() {

    emit(ProfilLoadingtState());
    DioHelper.getdata(
      url: GETPROFIL,
      headers: {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      print(value);
      myProfil = RegisterModrl.fromJson(value.data);
      // print(myProfil!.team.attributes.body);
      // print(myProfil!.data?.email);


      emit(ProfilSuccessState());

      // print(team_id);
      print("team_id");
    });
  }


  // final formKey = GlobalKey<FormState>();

  void EditProfil({
    required String? email,
    required String? first_name,
    required String? last_name,
  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(EditProfilLoadingtState());
    // formKey.currentState!.save();
    DioHelper.putdata(url: EDITPROFIL, headers: {
      "Accept": "application/json",
      'Authorization': "Bearer ${token}",

    }, posteddata: {
      "email": email,
      "last_name": last_name,
      "gender": "male",
      "first_name": first_name
    }).then((value) {

     // myProfil = RegisterModrl.fromJson(value.data);

      emit(EditProfilSuccessState());
      print("1111111111111111111111111111done");
      print(email);
      print(last_name);
      print(first_name);
      print(myProfil?.token);
      print(value.data["message"]);

    }).catchError((error) {

      print(error.toString());
      print("000000000000000000");
      print(email);
      print(first_name);
      print(last_name);
      print(myProfil?.message);
      print(error["message"]);
      emit(EditProfilErrorState());
    });
  }
}
