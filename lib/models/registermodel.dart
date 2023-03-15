class RegisterModrl {
  Data? data;
  String? message;
  String? token;



  RegisterModrl.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    token = json['token'];
  }


}

class Data {
  int? id;
  String? email ;
  String? name;
  String? firstName ;
  String? lastName ;
  Null? gender;
  Null? dateOfBirth;
  Null? phone;
  int? status;
  Group? group;
  Null? notes;
  String? createdAt;
  String? updatedAt;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    status = json['status'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Group {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;



  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}