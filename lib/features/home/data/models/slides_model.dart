import 'package:freezed_annotation/freezed_annotation.dart';

part 'slides_model.g.dart';

@JsonSerializable()
class SlidesModel {
  final bool? success;
  final String? message;
  @JsonKey(name: 'data')
  final List<SlideModel>? slides;

  SlidesModel({this.success, this.message, this.slides});

  factory SlidesModel.fromJson(Map<String, dynamic> json) =>
      _$SlidesModelFromJson(json);
}

@JsonSerializable()
class SlideModel {
  final int? id;
  final int? order;
  final String? text;
  final String? button;
  @JsonKey(name: 'text_position')
  final String? textPosition;
  @JsonKey(name: 'text_color')
  final String? textColor;
  @JsonKey(name: 'button_color')
  final String? buttonColor;
  @JsonKey(name: 'background_color')
  final String? backgroundColor;
  @JsonKey(name: 'indicator_color')
  final String? indicatorColor;
  @JsonKey(name: 'image_fit')
  final String? imageFit;
  @JsonKey(name: 'food_id')
  final int? foodId;
  @JsonKey(name: 'restaurant_id')
  final dynamic restaurantId;
  final bool? enabled;
  @JsonKey(name: 'has_media')
  final bool? hasMedia;
  final List<MediaModel>? media;
  SlideModel({
    this.id,
    this.order,
    this.text,
    this.button,
    this.textPosition,
    this.textColor,
    this.buttonColor,
    this.backgroundColor,
    this.indicatorColor,
    this.imageFit,
    this.foodId,
    this.restaurantId,
    this.enabled,
    this.hasMedia,
    this.media,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) =>
      _$SlideModelFromJson(json);
}

@JsonSerializable()
class MediaModel {
  final int? id;
  @JsonKey(name: 'model_type')
  final String? modelType;
  @JsonKey(name: 'model_id')
  final int? modelId;
  @JsonKey(name: 'collection_name')
  final String? collectionName;
  final String? name;
  final String? url;

  MediaModel({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.url,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}
