import 'package:equatable/equatable.dart';

class Image extends Equatable {
	final int? id;
	final String? path;
	final String? url;
	final String? originalImageUrl;
	final String? smallImageUrl;
	final String? mediumImageUrl;
	final String? largeImageUrl;

	const Image({
		this.id, 
		this.path, 
		this.url, 
		this.originalImageUrl, 
		this.smallImageUrl, 
		this.mediumImageUrl, 
		this.largeImageUrl, 
	});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				id: json['id'] as int?,
				path: json['path'] as String?,
				url: json['url'] as String?,
				originalImageUrl: json['original_image_url'] as String?,
				smallImageUrl: json['small_image_url'] as String?,
				mediumImageUrl: json['medium_image_url'] as String?,
				largeImageUrl: json['large_image_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'path': path,
				'url': url,
				'original_image_url': originalImageUrl,
				'small_image_url': smallImageUrl,
				'medium_image_url': mediumImageUrl,
				'large_image_url': largeImageUrl,
			};

	@override
	List<Object?> get props {
		return [
				id,
				path,
				url,
				originalImageUrl,
				smallImageUrl,
				mediumImageUrl,
				largeImageUrl,
		];
	}
}
