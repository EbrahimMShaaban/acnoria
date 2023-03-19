import 'package:equatable/equatable.dart';

import 'product.dart';

class Datum extends Equatable {
	final int? id;
	final Product? product;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Datum({this.id, this.product, this.createdAt, this.updatedAt});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				product: json['product'] == null
						? null
						: Product.fromJson(json['product'] as Map<String, dynamic>),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'product': product?.toJson(),
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props => [id, product, createdAt, updatedAt];
}
