import 'package:equatable/equatable.dart';

class BaseImage extends Equatable {
	final String? smallImageUrl;
	final String? mediumImageUrl;
	final String? largeImageUrl;
	final String? originalImageUrl;

	const BaseImage({
		this.smallImageUrl, 
		this.mediumImageUrl, 
		this.largeImageUrl, 
		this.originalImageUrl, 
	});

	factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
				smallImageUrl: json['small_image_url'] as String?,
				mediumImageUrl: json['medium_image_url'] as String?,
				largeImageUrl: json['large_image_url'] as String?,
				originalImageUrl: json['original_image_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'small_image_url': smallImageUrl,
				'medium_image_url': mediumImageUrl,
				'large_image_url': largeImageUrl,
				'original_image_url': originalImageUrl,
			};

	@override
	List<Object?> get props {
		return [
				smallImageUrl,
				mediumImageUrl,
				largeImageUrl,
				originalImageUrl,
		];
	}
}
