class CategoriesModel {
  List<Data>? data;

  CategoriesModel({this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {

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
  String? code;
  String? name;
  String? slug;
  String? displayMode;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? status;
  String? imageUrl;
  String? categoryIconPath;
  String? createdAt;
  String? updatedAt;
  List<Chidrens>? chidrens;

  Data(
      {this.id,
      this.code,
      this.name,
      this.slug,
      this.displayMode,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.status,
      this.imageUrl,
      this.categoryIconPath,
      this.createdAt,
      this.updatedAt,
      this.chidrens});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    displayMode = json['display_mode'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    imageUrl = json['image_url'];
    categoryIconPath = json['category_icon_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['chidrens'] != null) {
      chidrens = <Chidrens>[];
      json['chidrens'].forEach((v) {
        chidrens!.add(Chidrens.fromJson(v));
      });
    }
  }
}

class Chidrens {
  int? id;
  String? code;
  String? name;
  String? slug;
  String? displayMode;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? status;
  String? imageUrl;
  String? categoryIconPath;
  String? createdAt;
  String? updatedAt;
//  List<Chidrens>? chidrens;

  Chidrens(
      {this.id,
      this.code,
      this.name,
      this.slug,
      this.displayMode,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.status,
      this.imageUrl,
      this.categoryIconPath,
      this.createdAt,
      this.updatedAt,
   //   this.chidrens
      });

  Chidrens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    slug = json['slug'];
    displayMode = json['display_mode'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    imageUrl = json['image_url'];
    categoryIconPath = json['category_icon_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['chidrens'] != null) {
    //   chidrens = <Chidrens>[];
    //   json['chidrens'].forEach((v) {
    //     chidrens!.add(new Chidrens.fromJson(v));
    //   });
    // }
  }


}

// class Chidren {
//   int? id;
//   Null? code;
//   String? name;
//   String? slug;
//   String? displayMode;
//   Null? description;
//   Null? metaTitle;
//   Null? metaDescription;
//   Null? metaKeywords;
//   int? status;
//   Null? imageUrl;
//   Null? categoryIconPath;
//   String? createdAt;
//   String? updatedAt;
//   List<Chidrens>? chidrens;
//
//   Chidrens(
//       {this.id,
//         this.code,
//         this.name,
//         this.slug,
//         this.displayMode,
//         this.description,
//         this.metaTitle,
//         this.metaDescription,
//         this.metaKeywords,
//         this.status,
//         this.imageUrl,
//         this.categoryIconPath,
//         this.createdAt,
//         this.updatedAt,
//         this.chidrens});
//
//   Chidrens.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     code = json['code'];
//     name = json['name'];
//     slug = json['slug'];
//     displayMode = json['display_mode'];
//     description = json['description'];
//     metaTitle = json['meta_title'];
//     metaDescription = json['meta_description'];
//     metaKeywords = json['meta_keywords'];
//     status = json['status'];
//     imageUrl = json['image_url'];
//     categoryIconPath = json['category_icon_path'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['chidrens'] != null) {
//       chidrens = <Chidrens>[];
//       json['chidrens'].forEach((v) {
//         chidrens!.add( Chidrens.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['code'] = this.code;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['display_mode'] = this.displayMode;
//     data['description'] = this.description;
//     data['meta_title'] = this.metaTitle;
//     data['meta_description'] = this.metaDescription;
//     data['meta_keywords'] = this.metaKeywords;
//     data['status'] = this.status;
//     data['image_url'] = this.imageUrl;
//     data['category_icon_path'] = this.categoryIconPath;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.chidrens != null) {
//       data['chidrens'] = this.chidrens!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
