class CustomProductsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  CustomProductsModel({this.data, this.links, this.meta});

  CustomProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    links = json['links'] != null ?  Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ?  Meta.fromJson(json['meta']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   if (links != null) {
  //     data['links'] = this.links!.toJson();
  //   }
  //   if (this.meta != null) {
  //     data['meta'] = this.meta!.toJson();
  //   }
  //   return data;
  // }
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
 // List<Null>? videos;
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
   //     this.videos,
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
  //  this.percentage
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

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['total'] = this.total;
  //   data['total_rating'] = this.totalRating;
  //   data['average_rating'] = this.averageRating;
  //   if (this.percentage != null) {
  //     data['percentage'] = this.percentage!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Links {
  String? first;
  String? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Links2 {
  String? url;
  String? label;
  bool? active;

  Links2({this.url, this.label, this.active});

  Links2.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
