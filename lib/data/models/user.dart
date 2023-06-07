
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'email') @Default("") String email,
    @JsonKey(name: 'first_name') @Default("") String firstName,
    @JsonKey(name: 'last_name') @Default("") String lastName,
    @JsonKey(name: 'avatar') @Default("") String avatar
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
