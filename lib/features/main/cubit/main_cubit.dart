import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/screens/profile_screen.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  int index = 0;

  void changePage(int index) {
    this.index = index;
    emit(MainState.changing(index: index));
  }

  void reset() {
    emit(const MainState.initial());
  }

  void dispose() {
    emit(const MainState.initial());
  }

  final List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('fav')),
    const Center(child: Text('search')),
    const Center(child: Text('orders')),
    const ProfileScreen(),
  ];
}
