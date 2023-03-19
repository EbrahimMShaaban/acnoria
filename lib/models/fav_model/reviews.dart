import 'package:equatable/equatable.dart';

class Reviews extends Equatable {
	final int? total;
	final int? totalRating;
	final int? averageRating;
	final List<dynamic>? percentage;

	const Reviews({
		this.total, 
		this.totalRating, 
		this.averageRating, 
		this.percentage, 
	});

	factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
				total: json['total'] as int?,
				totalRating: json['total_rating'] as int?,
				averageRating: json['average_rating'] as int?,
				percentage: json['percentage'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'total': total,
				'total_rating': totalRating,
				'average_rating': averageRating,
				'percentage': percentage,
			};

	@override
	List<Object?> get props {
		return [
				total,
				totalRating,
				averageRating,
				percentage,
		];
	}
}
