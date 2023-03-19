import 'package:equatable/equatable.dart';

import 'base_image.dart';
import 'image.dart';
import 'reviews.dart';

class Product extends Equatable {
	final int? id;
	final String? sku;
	final String? type;
	final String? name;
	final String? urlKey;
	final String? price;
	final String? formatedPrice;
	final String? shortDescription;
	final String? description;
	final List<Image>? images;
	final List<dynamic>? videos;
	final BaseImage? baseImage;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Reviews? reviews;
	final bool? inStock;
	final bool? isSaved;
	final bool? isWishlisted;
	final bool? isItemInCart;
	final bool? showQuantityChanger;

	const Product({
		this.id, 
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
		this.showQuantityChanger, 
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				id: json['id'] as int?,
				sku: json['sku'] as String?,
				type: json['type'] as String?,
				name: json['name'] as String?,
				urlKey: json['url_key'] as String?,
				price: json['price'] as String?,
				formatedPrice: json['formated_price'] as String?,
				shortDescription: json['short_description'] as String?,
				description: json['description'] as String?,
				images: (json['images'] as List<dynamic>?)
						?.map((e) => Image.fromJson(e as Map<String, dynamic>))
						.toList(),
				videos: json['videos'] as List<dynamic>?,
				baseImage: json['base_image'] == null
						? null
						: BaseImage.fromJson(json['base_image'] as Map<String, dynamic>),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				reviews: json['reviews'] == null
						? null
						: Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
				inStock: json['in_stock'] as bool?,
				isSaved: json['is_saved'] as bool?,
				isWishlisted: json['is_wishlisted'] as bool?,
				isItemInCart: json['is_item_in_cart'] as bool?,
				showQuantityChanger: json['show_quantity_changer'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'sku': sku,
				'type': type,
				'name': name,
				'url_key': urlKey,
				'price': price,
				'formated_price': formatedPrice,
				'short_description': shortDescription,
				'description': description,
				'images': images?.map((e) => e.toJson()).toList(),
				'videos': videos,
				'base_image': baseImage?.toJson(),
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'reviews': reviews?.toJson(),
				'in_stock': inStock,
				'is_saved': isSaved,
				'is_wishlisted': isWishlisted,
				'is_item_in_cart': isItemInCart,
				'show_quantity_changer': showQuantityChanger,
			};

	@override
	List<Object?> get props {
		return [
				id,
				sku,
				type,
				name,
				urlKey,
				price,
				formatedPrice,
				shortDescription,
				description,
				images,
				videos,
				baseImage,
				createdAt,
				updatedAt,
				reviews,
				inStock,
				isSaved,
				isWishlisted,
				isItemInCart,
				showQuantityChanger,
		];
	}
}
