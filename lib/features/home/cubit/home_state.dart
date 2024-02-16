import 'package:foodec/features/home/data/models/slides_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/categories_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.slidesLoading() = SlidesLoading;
  const factory HomeState.slidesSuccess(SlidesModel data) = SlidesSuccess<T>;
  const factory HomeState.slidesError({required String error}) = SlidesError;

  const factory HomeState.categoriesLoading() = CategoriesLoading;
  const factory HomeState.categoriesSuccess(CategoriesModel data) =
      CategoriesSuccess<T>;
  const factory HomeState.categoriesError({required String error}) =
      CategoriesError;
}
