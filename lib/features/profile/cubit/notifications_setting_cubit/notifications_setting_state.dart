// ignore_for_file: public_member_api_docs, sort_constructors_first

class NotificationsSettingState {
  final bool switchNotification;
  final bool switchSound;
  final bool switchVibrate;
  final bool switchAppUpdates;
  final bool switchSpecialOffers;

  const NotificationsSettingState({
    required this.switchNotification,
    required this.switchSound,
    required this.switchVibrate,
    required this.switchAppUpdates,
    required this.switchSpecialOffers,
  });

  List<Object?> get props => [
        switchNotification,
        switchSound,
        switchVibrate,
        switchAppUpdates,
        switchSpecialOffers,
      ];

  NotificationsSettingState copyWith({
    bool? switchNotification,
    bool? switchSound,
    bool? switchVibrate,
    bool? switchAppUpdates,
    bool? switchSpecialOffers,
  }) {
    return NotificationsSettingState(
      switchNotification: switchNotification ?? this.switchNotification,
      switchSound: switchSound ?? this.switchSound,
      switchVibrate: switchVibrate ?? this.switchVibrate,
      switchAppUpdates: switchAppUpdates ?? this.switchAppUpdates,
      switchSpecialOffers: switchSpecialOffers ?? this.switchSpecialOffers,
    );
  }
}
