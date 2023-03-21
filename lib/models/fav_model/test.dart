import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class AllFavouritesModel extends Equatable {
	final List<Datum>? data;
	final Links? links;
	final Meta? meta;

	const AllFavouritesModel({this.data, this.links, this.meta});

	factory AllFavouritesModel.fromJson(Map<String, dynamic> json) => AllFavouritesModel(
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
				links: json['links'] == null
						? null
						: Links.fromJson(json['links'] as Map<String, dynamic>),
				meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
				'links': links?.toJson(),
				'meta': meta?.toJson(),
			};

	@override
	List<Object?> get props => [data, links, meta];
}