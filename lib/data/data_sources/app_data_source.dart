
import 'package:demo_users/data/models/response/user_list_response.dart';
import 'package:demo_users/data/models/response/user_response.dart';
import 'package:demo_users/data/models/user_body.dart';

abstract class AppDataSource {
  Future<UserListResponse> getUserList(int page);
  Future<UserResponse> getUser(int userId);
  Future<UserBody> createUser(UserBody body);
  Future<UserBody> updateUser(int userId, UserBody body);
  Future<bool> deleteUser(int userId);
}
