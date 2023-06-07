
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';
import '../user.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@Freezed()
class UserResponse with _$UserResponse {
  const UserResponse._();

  const factory UserResponse({
    @JsonKey(name: 'data') User? data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  UserEntity? toDomain() {
    if (data != null) {
      return UserEntity(
        id: data!.id,
        email: data!.email,
        firstName: data!.firstName,
        lastName: data!.lastName,
        avatar: data!.avatar
      );
    }

    return null;
  }
}