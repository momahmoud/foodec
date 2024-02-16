import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodec/features/home/data/repo/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void getSlides() async {
    emit(const HomeState.slidesLoading());
    final response = await _homeRepo.getSlides();

    response.when(
      success: (data) {
        emit(HomeState.slidesSuccess(data));
      },
      failure: (error) => emit(
        HomeState.slidesError(error: error.apiErrorModel.message ?? ""),
      ),
    );
  }

  void getCategories() async {
    emit(const HomeState.categoriesLoading());
    final response = await _homeRepo.getCategories();

    response.when(
      success: (data) => emit(HomeState.categoriesSuccess(data)),
      failure: (error) => emit(
          HomeState.categoriesError(error: error.apiErrorModel.message ?? "")),
    );
  }
}
