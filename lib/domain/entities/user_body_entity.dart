
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body_entity.freezed.dart';

@Freezed()
class UserBodyEntity with _$UserBodyEntity {
  const factory UserBodyEntity({
    @Default("") String id,
    @Default("") String name,
    @Default("") String job,
    @Default("") String createdAt,
    @Default("") String updatedAt,
  }) = _UserBodyEntity;
}
