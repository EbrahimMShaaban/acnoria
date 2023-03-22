import 'package:acnoria/models/LocationKodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/registermodel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

part 'Location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of(context);

  LocationModel? myLocation;
  LocationiDModel? locationiDModel;

  void getLocation() {
    emit(GetLocationLoadingtState());
    DioHelper.getdata(
      url: addresses_get,
      headers: {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      myLocation = LocationModel.fromJson(value.data);
      // print(myLocation!.data?.email);

      emit(GetLocationSuccessState());

       print("11111111111111 done");
      print(value.data["data"]);
    }).catchError((error) {
      print(error);
      print("00000000000000000000000ddddddddddddddddddddddd000000");
      emit(GetLocationErrorState());
    });
  }
  void getLocationId() {
    emit(GetLocationIdLoadingtState());
    DioHelper.getdata(
      url: "$addresses_get$idlocaton",
      headers: {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      locationiDModel = LocationiDModel.fromJson(value.data);
      // print(myLocation!.data?.email);

      emit(GetLocationIdSuccessState());

       print("11111111111111 done");
      print(value.data["data"]);
    }).catchError((error) {
      print(error);
      print("00000000000000000000000ddddddddddddddddddddddd000000");
      emit(GetLocationIdErrorState());
    });
  }


  // final formKey = GlobalKey<FormState>();

  void PostLocation({
    required String? city,
    required String? country,
    required String? country_name,
    required String? phone,
    required String? state,
    required String? postcode,
  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(PostLocationLoadingtState());
    // formKey.currentState!.save();
    DioHelper.postdata(url: addresses_post, headers: {
      "Accept": "application/json",
      'Authorization': "Bearer ${token}",

    }, posteddata: {

      "address1": [
        "Clock Tower"
      ],
      "country":country,
      "country_name": country,
      "state": state,
      "city": city,
      "postcode": postcode,
      "phone": phone,
    },).then((value) {
      // myLocation = RegisterModrl.fromJson(value.data);
      print("1111111111111111111111111111done");
      print(value.data["data"]["id"]);
      print(value.data["data"]);
      idlocaton =value.data["data"]["id"];
      emit(PostLocationSuccessState());
    }).catchError((error) {
      print(error.toString());
      print("000000000000000000");
      emit(PostLocationErrorState());
    });
  }
}
