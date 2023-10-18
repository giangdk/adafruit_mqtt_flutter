import 'package:workmanager_example/data/model/user_local/user_model_local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {required bool isLoading,
      UserLocal? userLocal,
      String? error}) = _ProfileState;

  factory ProfileState.initial({
    String? id,
  }) =>
      const ProfileState(
        isLoading: false,
      );
}
