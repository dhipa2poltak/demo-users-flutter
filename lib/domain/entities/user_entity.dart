
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@Freezed()
class UserEntity with _$UserEntity {
  const factory UserEntity({
    @Default(-1) int id,
    @Default("") String email,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String avatar
  }) = _UserEntity;
}
