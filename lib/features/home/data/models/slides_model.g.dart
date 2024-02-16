// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slides_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidesModel _$SlidesModelFromJson(Map<String, dynamic> json) => SlidesModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      slides: (json['data'] as List<dynamic>?)
          ?.map((e) => SlideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlidesModelToJson(SlidesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.slides,
    };

SlideModel _$SlideModelFromJson(Map<String, dynamic> json) => SlideModel(
      id: json['id'] as int?,
      order: json['order'] as int?,
      text: json['text'] as String?,
      button: json['button'] as String?,
      textPosition: json['text_position'] as String?,
      textColor: json['text_color'] as String?,
      buttonColor: json['button_color'] as String?,
      backgroundColor: json['background_color'] as String?,
      indicatorColor: json['indicator_color'] as String?,
      imageFit: json['image_fit'] as String?,
      foodId: json['food_id'] as int?,
      restaurantId: json['restaurant_id'],
      enabled: json['enabled'] as bool?,
      hasMedia: json['has_media'] as bool?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlideModelToJson(SlideModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'text': instance.text,
      'button': instance.button,
      'text_position': instance.textPosition,
      'text_color': instance.textColor,
      'button_color': instance.buttonColor,
      'background_color': instance.backgroundColor,
      'indicator_color': instance.indicatorColor,
      'image_fit': instance.imageFit,
      'food_id': instance.foodId,
      'restaurant_id': instance.restaurantId,
      'enabled': instance.enabled,
      'has_media': instance.hasMedia,
      'media': instance.media,
    };

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      id: json['id'] as int?,
      modelType: json['model_type'] as String?,
      modelId: json['model_id'] as int?,
      collectionName: json['collection_name'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model_type': instance.modelType,
      'model_id': instance.modelId,
      'collection_name': instance.collectionName,
      'name': instance.name,
      'url': instance.url,
    };
