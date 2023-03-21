class CartDetailsModel {
  Data? data;



  CartDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}


class Data {
  int? id;
  String? customerEmail;
  String? message;
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
  String? payment;
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

}

class Items {
  int? id;
  int quantity =1;
  String? sku;
  String? type;
  String? name;
  // String? couponCode;
  String? weight;
  String? totalWeight;
  String? baseTotalWeight;
  String? price;
  String? formatedPrice;
  String? basePrice;
  String? formatedBasePrice;
  String? customPrice;
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



  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    sku = json['sku'];
    type = json['type'];
    name = json['name'];
    // couponCode = json['coupon_code'];
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

}

class Additional {
  int? productId;
  int? quantity;
  String? token;


  Additional.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    token = json['token'];
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

}

class Images {
  int? id;
  String? path;
  String? url;
  String? originalImageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;



  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    url = json['url'];
    originalImageUrl = json['original_image_url'];
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
  }


}

class BaseImage {
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? originalImageUrl;



  BaseImage.fromJson(Map<String, dynamic> json) {
    smallImageUrl = json['small_image_url'];
    mediumImageUrl = json['medium_image_url'];
    largeImageUrl = json['large_image_url'];
    originalImageUrl = json['original_image_url'];
  }


}

class Reviews {
  int? total;
  int? totalRating;
  int? averageRating;
  List<String>? percentage;


  Reviews.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalRating = json['total_rating'];
    averageRating = json['average_rating'];
    percentage = json['percentage'].cast<String>();
  }

}
