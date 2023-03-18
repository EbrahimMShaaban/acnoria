class CartDetailsModel {
  Data? data;

  CartDetailsModel({this.data});

  CartDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? customerEmail;
  String? customerFirstName;
  String? customerLastName;
  String? shippingMethod;
  String? couponCode;
  int? isGift;
  int? itemsCount;
  String? itemsQty;
  String? exchangeRate;
  String? globalCurrencyCode;
  String? baseCurrencyCode;
  String? channelCurrencyCode;
  String? cartCurrencyCode;
  String? grandTotal;
  String? formatedGrandTotal;
  String? baseGrandTotal;
  String? formatedBaseGrandTotal;
  String? subTotal;
  String? formatedSubTotal;
  String? baseSubTotal;
  String? formatedBaseSubTotal;
  String? taxTotal;
  String? formatedTaxTotal;
  String? baseTaxTotal;
  String? formatedBaseTaxTotal;
  String? discount;
  String? formatedDiscount;
  String? baseDiscount;
  String? formatedBaseDiscount;
  String? checkoutMethod;
  int? isGuest;
  int? isActive;
  String? conversionTime;
  String? customer;
  String? channel;
  List<Items>? items;
  String? selectedShippingRate;
  Null? payment;
  String? billingAddress;
  String? shippingAddress;
  String? createdAt;
  String? updatedAt;
  String? taxes;
  String? formatedTaxes;
  String? baseTaxes;
  String? formatedBaseTaxes;
  String? formatedDiscountedSubTotal;
  String? formatedBaseDiscountedSubTotal;

  Data(
      {this.id,
        this.customerEmail,
        this.customerFirstName,
        this.customerLastName,
        this.shippingMethod,
        this.couponCode,
        this.isGift,
        this.itemsCount,
        this.itemsQty,
        this.exchangeRate,
        this.globalCurrencyCode,
        this.baseCurrencyCode,
        this.channelCurrencyCode,
        this.cartCurrencyCode,
        this.grandTotal,
        this.formatedGrandTotal,
        this.baseGrandTotal,
        this.formatedBaseGrandTotal,
        this.subTotal,
        this.formatedSubTotal,
        this.baseSubTotal,
        this.formatedBaseSubTotal,
        this.taxTotal,
        this.formatedTaxTotal,
        this.baseTaxTotal,
        this.formatedBaseTaxTotal,
        this.discount,
        this.formatedDiscount,
        this.baseDiscount,
        this.formatedBaseDiscount,
        this.checkoutMethod,
        this.isGuest,
        this.isActive,
        this.conversionTime,
        this.customer,
        this.channel,
        this.items,
        this.selectedShippingRate,
        this.payment,
        this.billingAddress,
        this.shippingAddress,
        this.createdAt,
        this.updatedAt,
        this.taxes,
        this.formatedTaxes,
        this.baseTaxes,
        this.formatedBaseTaxes,
        this.formatedDiscountedSubTotal,
        this.formatedBaseDiscountedSubTotal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerEmail = json['customer_email'];
    customerFirstName = json['customer_first_name'];
    customerLastName = json['customer_last_name'];
    shippingMethod = json['shipping_method'];
    couponCode = json['coupon_code'];
    isGift = json['is_gift'];
    itemsCount = json['items_count'];
    itemsQty = json['items_qty'];
    exchangeRate = json['exchange_rate'];
    globalCurrencyCode = json['global_currency_code'];
    baseCurrencyCode = json['base_currency_code'];
    channelCurrencyCode = json['channel_currency_code'];
    cartCurrencyCode = json['cart_currency_code'];
    grandTotal = json['grand_total'];
    formatedGrandTotal = json['formated_grand_total'];
    baseGrandTotal = json['base_grand_total'];
    formatedBaseGrandTotal = json['formated_base_grand_total'];
    subTotal = json['sub_total'];
    formatedSubTotal = json['formated_sub_total'];
    baseSubTotal = json['base_sub_total'];
    formatedBaseSubTotal = json['formated_base_sub_total'];
    taxTotal = json['tax_total'];
    formatedTaxTotal = json['formated_tax_total'];
    baseTaxTotal = json['base_tax_total'];
    formatedBaseTaxTotal = json['formated_base_tax_total'];
    discount = json['discount'];
    formatedDiscount = json['formated_discount'];
    baseDiscount = json['base_discount'];
    formatedBaseDiscount = json['formated_base_discount'];
    checkoutMethod = json['checkout_method'];
    isGuest = json['is_guest'];
    isActive = json['is_active'];
    conversionTime = json['conversion_time'];
    customer = json['customer'];
    channel = json['channel'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    selectedShippingRate = json['selected_shipping_rate'];
    payment = json['payment'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxes = json['taxes'];
    formatedTaxes = json['formated_taxes'];
    baseTaxes = json['base_taxes'];
    formatedBaseTaxes = json['formated_base_taxes'];
    formatedDiscountedSubTotal = json['formated_discounted_sub_total'];
    formatedBaseDiscountedSubTotal = json['formated_base_discounted_sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_email'] = this.customerEmail;
    data['customer_first_name'] = this.customerFirstName;
    data['customer_last_name'] = this.customerLastName;
    data['shipping_method'] = this.shippingMethod;
    data['coupon_code'] = this.couponCode;
    data['is_gift'] = this.isGift;
    data['items_count'] = this.itemsCount;
    data['items_qty'] = this.itemsQty;
    data['exchange_rate'] = this.exchangeRate;
    data['global_currency_code'] = this.globalCurrencyCode;
    data['base_currency_code'] = this.baseCurrencyCode;
    data['channel_currency_code'] = this.channelCurrencyCode;
    data['cart_currency_code'] = this.cartCurrencyCode;
    data['grand_total'] = this.grandTotal;
    data['formated_grand_total'] = this.formatedGrandTotal;
    data['base_grand_total'] = this.baseGrandTotal;
    data['formated_base_grand_total'] = this.formatedBaseGrandTotal;
    data['sub_total'] = this.subTotal;
    data['formated_sub_total'] = this.formatedSubTotal;
    data['base_sub_total'] = this.baseSubTotal;
    data['formated_base_sub_total'] = this.formatedBaseSubTotal;
    data['tax_total'] = this.taxTotal;
    data['formated_tax_total'] = this.formatedTaxTotal;
    data['base_tax_total'] = this.baseTaxTotal;
    data['formated_base_tax_total'] = this.formatedBaseTaxTotal;
    data['discount'] = this.discount;
    data['formated_discount'] = this.formatedDiscount;
    data['base_discount'] = this.baseDiscount;
    data['formated_base_discount'] = this.formatedBaseDiscount;
    data['checkout_method'] = this.checkoutMethod;
    data['is_guest'] = this.isGuest;
    data['is_active'] = this.isActive;
    data['conversion_time'] = this.conversionTime;
    data['customer'] = this.customer;
    data['channel'] = this.channel;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['selected_shipping_rate'] = this.selectedShippingRate;
    data['payment'] = this.payment;
    data['billing_address'] = this.billingAddress;
    data['shipping_address'] = this.shippingAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['taxes'] = this.taxes;
    data['formated_taxes'] = this.formatedTaxes;
    data['base_taxes'] = this.baseTaxes;
    data['formated_base_taxes'] = this.formatedBaseTaxes;
    data['formated_discounted_sub_total'] = this.formatedDiscountedSubTotal;
    data['formated_base_discounted_sub_total'] =
        this.formatedBaseDiscountedSubTotal;
    return data;
  }
}

class Items {
  int? id;
  int? quantity;
  String? sku;
  String? type;
  String? name;
  Null? couponCode;
  String? weight;
  String? totalWeight;
  String? baseTotalWeight;
  String? price;
  String? formatedPrice;
  String? basePrice;
  String? formatedBasePrice;
  Null? customPrice;
  String? formatedCustomPrice;
  String? total;
  String? formatedTotal;
  String? baseTotal;
  String? formatedBaseTotal;
  String? taxPercent;
  String? taxAmount;
  String? formatedTaxAmount;
  String? baseTaxAmount;
  String? formatedBaseTaxAmount;
  String? discountPercent;
  String? discountAmount;
  String? formatedDiscountAmount;
  String? baseDiscountAmount;
  String? formatedBaseDiscountAmount;
  Additional? additional;
  String? child;
  Product? product;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
        this.quantity,
        this.sku,
        this.type,
        this.name,
        this.couponCode,
        this.weight,
        this.totalWeight,
        this.baseTotalWeight,
        this.price,
        this.formatedPrice,
        this.basePrice,
        this.formatedBasePrice,
        this.customPrice,
        this.formatedCustomPrice,
        this.total,
        this.formatedTotal,
        this.baseTotal,
        this.formatedBaseTotal,
        this.taxPercent,
        this.taxAmount,
        this.formatedTaxAmount,
        this.baseTaxAmount,
        this.formatedBaseTaxAmount,
        this.discountPercent,
        this.discountAmount,
        this.formatedDiscountAmount,
        this.baseDiscountAmount,
        this.formatedBaseDiscountAmount,
        this.additional,
        this.child,
        this.product,
        this.createdAt,
        this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    couponCode = json['coupon_code'];
    weight = json['weight'];
    totalWeight = json['total_weight'];
    baseTotalWeight = json['base_total_weight'];
    price = json['price'];
    formatedPrice = json['formated_price'];
    basePrice = json['base_price'];
    formatedBasePrice = json['formated_base_price'];
    customPrice = json['custom_price'];
    formatedCustomPrice = json['formated_custom_price'];
    total = json['total'];
    formatedTotal = json['formated_total'];
    baseTotal = json['base_total'];
    formatedBaseTotal = json['formated_base_total'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    formatedTaxAmount = json['formated_tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    formatedBaseTaxAmount = json['formated_base_tax_amount'];
    discountPercent = json['discount_percent'];
    discountAmount = json['discount_amount'];
    formatedDiscountAmount = json['formated_discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    formatedBaseDiscountAmount = json['formated_base_discount_amount'];
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
    child = json['child'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['sku'] = this.sku;
    data['type'] = this.type;
    data['name'] = this.name;
    data['coupon_code'] = this.couponCode;
    data['weight'] = this.weight;
    data['total_weight'] = this.totalWeight;
    data['base_total_weight'] = this.baseTotalWeight;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['base_price'] = this.basePrice;
    data['formated_base_price'] = this.formatedBasePrice;
    data['custom_price'] = this.customPrice;
    data['formated_custom_price'] = this.formatedCustomPrice;
    data['total'] = this.total;
    data['formated_total'] = this.formatedTotal;
    data['base_total'] = this.baseTotal;
    data['formated_base_total'] = this.formatedBaseTotal;
    data['tax_percent'] = this.taxPercent;
    data['tax_amount'] = this.taxAmount;
    data['formated_tax_amount'] = this.formatedTaxAmount;
    data['base_tax_amount'] = this.baseTaxAmount;
    data['formated_base_tax_amount'] = this.formatedBaseTaxAmount;
    data['discount_percent'] = this.discountPercent;
    data['discount_amount'] = this.discountAmount;
    data['formated_discount_amount'] = this.formatedDiscountAmount;
    data['base_discount_amount'] = this.baseDiscountAmount;
    data['formated_base_discount_amount'] = this.formatedBaseDiscountAmount;
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }
    data['child'] = this.child;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Additional {
  int? productId;
  int? quantity;
  String? token;

  Additional({this.productId, this.quantity, this.token});

  Additional.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['token'] = this.token;
    return data;
  }
}

class Product {
  int? id;
  String? sku;
  String? type;
  String? name;
  String? urlKey;
  String? price;
  String? formatedPrice;
  String? shortDescription;
  String? description;
  List<Images>? images;
  List<String>? videos;
  BaseImage? baseImage;
  String? createdAt;
  String? updatedAt;
  Reviews? reviews;
  bool? inStock;
  bool? isSaved;
  bool? isWishlisted;
  bool? isItemInCart;
  bool? showQuantityChanger;

  Product(
      {this.id,
        this.sku,
        this.type,
        this.name,
        this.urlKey,
        this.price,
        this.formatedPrice,
        this.shortDescription,
        this.description,
        this.images,
        this.videos,
        this.baseImage,
        this.createdAt,
        this.updatedAt,
        this.reviews,
        this.inStock,
        this.isSaved,
        this.isWishlisted,
        this.isItemInCart,
        this.showQuantityChanger});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    type = json['type'];
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
    videos = json['videos'].cast<String>();
    baseImage = json['base_image'] != null
        ? new BaseImage.fromJson(json['base_image'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    inStock = json['in_stock'];
    isSaved = json['is_saved'];
    isWishlisted = json['is_wishlisted'];
    isItemInCart = json['is_item_in_cart'];
    showQuantityChanger = json['show_quantity_changer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['type'] = this.type;
    data['name'] = this.name;
    data['url_key'] = this.urlKey;
    data['price'] = this.price;
    data['formated_price'] = this.formatedPrice;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['videos'] = this.videos;
    if (this.baseImage != null) {
      data['base_image'] = this.baseImage!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['in_stock'] = this.inStock;
    data['is_saved'] = this.isSaved;
    data['is_wishlisted'] = this.isWishlisted;
    data['is_item_in_cart'] = this.isItemInCart;
    data['show_quantity_changer'] = this.showQuantityChanger;
    return data;
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
  List<String>? percentage;

  Reviews({this.total, this.totalRating, this.averageRating, this.percentage});

  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    percentage = json['percentage'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_rating'] = this.totalRating;
    data['average_rating'] = this.averageRating;
    data['percentage'] = this.percentage;
    return data;
  }
}
