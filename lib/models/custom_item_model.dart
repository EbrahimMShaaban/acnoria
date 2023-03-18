class CustemItemModel {
  Data? data;

  CustemItemModel({this.data});

  CustemItemModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? id;
  String? sku;
  String? type;
  bool? canBeReturned;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? name;
  String? urlKey;
  String? price;
  String? formatedPrice;
  String? shortDescription;
  String? description;
  List<Images>? images;
 // List<String>? videos;
  BaseImage? baseImage;
  String? createdAt;
  String? updatedAt;
  Reviews? reviews;
  bool? inStock;
  bool? isSaved;
  bool? isItemInCart;
  bool? showQuantityChanger;

  Data(
      {this.id,
        this.sku,
        this.type,
        this.canBeReturned,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.name,
        this.urlKey,
        this.price,
        this.formatedPrice,
        this.shortDescription,
        this.description,
        this.images,
    //    this.videos,
        this.baseImage,
        this.createdAt,
        this.updatedAt,
        this.reviews,
        this.inStock,
        this.isSaved,
        this.isItemInCart,
        this.showQuantityChanger});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
    canBeReturned = json['can_be_returned'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    name = json['name'];
    urlKey = json['url_key'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    shortDescription = json['short_description'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    // if (json['videos'] != null) {
    //   videos = <Null>[];
    //   json['videos'].forEach((v) {
    //     videos!.add(new Null.fromJson(v));
    //   });
    // }
    baseImage = json['base_image'] != null
        ? new BaseImage.fromJson(json['base_image'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    inStock = json['in_stock'];
    isSaved = json['is_saved'];
    isItemInCart = json['is_item_in_cart'];
    showQuantityChanger = json['show_quantity_changer'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['sku'] = this.sku;
  //   data['type'] = this.type;
  //   data['can_be_returned'] = this.canBeReturned;
  //   data['meta_title'] = this.metaTitle;
  //   data['meta_keywords'] = this.metaKeywords;
  //   data['meta_description'] = this.metaDescription;
  //   data['name'] = this.name;
  //   data['url_key'] = this.urlKey;
  //   data['price'] = this.price;
  //   data['formated_price'] = this.formatedPrice;
  //   data['short_description'] = this.shortDescription;
  //   data['description'] = this.description;
  //   if (this.images != null) {
  //     data['images'] = this.images!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.videos != null) {
  //     data['videos'] = this.videos!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.baseImage != null) {
  //     data['base_image'] = this.baseImage!.toJson();
  //   }
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.reviews != null) {
  //     data['reviews'] = this.reviews!.toJson();
  //   }
  //   data['in_stock'] = this.inStock;
  //   data['is_saved'] = this.isSaved;
  //   data['is_item_in_cart'] = this.isItemInCart;
  //   data['show_quantity_changer'] = this.showQuantityChanger;
  //   return data;
  // }
}

class Images {
  int? id;
  String? path;
  String? url;
  String? originalImageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;

  Images(
      {this.id,
        this.path,
        this.url,
        this.originalImageUrl,
        this.smallImageUrl,
        this.mediumImageUrl,
        this.largeImageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    url = json['url'];
    originalImageUrl = json['original_image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['url'] = this.url;
    data['original_image_url'] = this.originalImageUrl;
    data['small_image_url'] = this.smallImageUrl;
    data['medium_image_url'] = this.mediumImageUrl;
    data['large_image_url'] = this.largeImageUrl;
    return data;
  }
}

class BaseImage {
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? originalImageUrl;

  BaseImage(
      {this.smallImageUrl,
        this.mediumImageUrl,
        this.largeImageUrl,
        this.originalImageUrl});

  BaseImage.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    originalImageUrl = json['original_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small_image_url'] = this.smallImageUrl;
    data['medium_image_url'] = this.mediumImageUrl;
    data['large_image_url'] = this.largeImageUrl;
    data['original_image_url'] = this.originalImageUrl;
    return data;
  }
}

class Reviews {
  int? total;
  int? totalRating;
  int? averageRating;
 // List<Null>? percentage;

  Reviews({this.total, this.totalRating, this.averageRating,
    //this.percentage
  });

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    // if (json['percentage'] != null) {
    //   percentage = <Null>[];
    //   json['percentage'].forEach((v) {
    //     percentage!.add(new Null.fromJson(v));
    //   });
    // }
  }


}
