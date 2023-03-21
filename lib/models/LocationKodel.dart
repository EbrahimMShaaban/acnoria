class LocationModel {
  List<Data>? data;



  LocationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}
class Data {
  int? id;
  List? address1;
  String? country;
  String? country_name;
  String? state;
  String? city;
  String? postcode;
  String? phone;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address1 = json['address1'];
    country = json['country'];
    country_name = json['country_name'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    phone = json['phone'];


    // if (json['videos'] != null) {
    //   videos = <Null>[];
    //   json['videos'].forEach((v) {
    //     videos!.add(new Null.fromJson(v));
    //   });
    // }

  }

}






class LocationiDModel {
  DataId? data;



  LocationiDModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataId.fromJson(json['data']) : null;
  }


}
class DataId{
  int? id;
  List? address1;
  String? country;
  String? country_name;
  String? state;
  String? city;
  String? postcode;
  String? phone;



  DataId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address1 = json['address1'];
    country = json['country'];
    country_name = json['country_name'];
    state = json['state'];
    city = json['city'];
    postcode = json['postcode'];
    phone = json['phone'];


    // if (json['videos'] != null) {
    //   videos = <Null>[];
    //   json['videos'].forEach((v) {
    //     videos!.add(new Null.fromJson(v));
    //   });
    // }

  }

}
