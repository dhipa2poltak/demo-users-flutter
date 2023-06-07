
import 'package:demo_users/domain/entities/user_body_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_body.freezed.dart';
part 'user_body.g.dart';

@Freezed()
class UserBody with _$UserBody {
  const UserBody._();

  const factory UserBody({
    @JsonKey(name: 'id') @Default("") String id,
    @JsonKey(name: 'name') @Default("") String name,
    @JsonKey(name: 'job') @Default("") String job,
    @JsonKey(name: 'createdAt') @Default("") String createdAt,
    @JsonKey(name: 'updatedAt') @Default("") String updatedAt,
  }) = _UserBody;

  factory UserBody.fromJson(Map<String, dynamic> json) => _$UserBodyFromJson(json);

  static UserBody fromDomain(UserBodyEntity entity) {
    return UserBody(name: entity.name, job: entity.job);
  }

  UserBodyEntity toDomain() {
    return UserBodyEntity(
        id: id,
        name: name,
        job: job,
        createdAt: createdAt,
        updatedAt: updatedAt
    );
  }
}
