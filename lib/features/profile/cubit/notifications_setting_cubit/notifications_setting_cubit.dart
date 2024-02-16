import 'package:flutter_bloc/flutter_bloc.dart';

import 'notifications_setting_state.dart';

class NotificationsSettingCubit extends Cubit<NotificationsSettingState> {
  NotificationsSettingCubit()
      : super(const NotificationsSettingState(
          switchNotification: false,
          switchSound: false,
          switchVibrate: false,
          switchAppUpdates: false,
          switchSpecialOffers: false,
        ));

  void switchNotification(bool value) {
    emit(state.copyWith(switchNotification: value));
  }

  void switchSound(bool value) {
    emit(state.copyWith(switchSound: value));
  }

  void switchVibrate(bool value) {
    emit(state.copyWith(switchVibrate: value));
  }

  void switchAppUpdates(bool value) {
    emit(state.copyWith(switchAppUpdates: value));
  }

  void switchSpecialOffers(bool value) {
    emit(state.copyWith(switchSpecialOffers: value));
  }
}
