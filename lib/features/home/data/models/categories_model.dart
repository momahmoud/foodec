import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:foodec/features/home/data/models/slides_model.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final bool? success;
  final String? message;
  @JsonKey(name: 'data')
  final List<CategoryModel>? categories;
  CategoriesModel({
    this.success,
    this.message,
    this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String? name;
  final String? description;
  @JsonKey(name: 'has_media')
  final bool? hasMedia;
  final List<MediaModel>? media;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.hasMedia,
    this.media,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
