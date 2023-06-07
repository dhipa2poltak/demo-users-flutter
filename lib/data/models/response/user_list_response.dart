

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';
import '../user.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@Freezed()
class UserListResponse with _$UserListResponse {
  const UserListResponse._();

  const factory UserListResponse({
    @JsonKey(name: 'data') @Default(<User>[]) List<User> data,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(Map<String, dynamic> json) => _$UserListResponseFromJson(json);

  List<UserEntity>? toDomain() {
    final userEntities = data.map((e) => UserEntity(
      id: e.id,
      email: e.email,
      firstName: e.firstName,
      lastName: e.lastName,
      avatar: e.avatar
    ));

    return userEntities.toList();
  }
}
