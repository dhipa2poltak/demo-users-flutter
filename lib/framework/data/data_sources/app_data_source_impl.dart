
import 'package:demo_users/data/models/response/user_list_response.dart';
import 'package:demo_users/data/models/response/user_response.dart';
import 'package:demo_users/data/models/user_body.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/app_data_source.dart';
import '../core/api_client.dart';

@lazySingleton
class AppDataSourceImpl extends AppDataSource {
  AppDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<UserBody> createUser(UserBody body) {
    return apiClient.createUser(body);
  }

  @override
  Future<bool> deleteUser(int userId) {
    return apiClient.deleteUser(userId).then((value) => true);
  }

  @override
  Future<UserResponse> getUser(int userId) {
    return apiClient.getUser(userId);
  }

  @override
  Future<UserListResponse> getUserList(int page) {
    return apiClient.getUserList(page);
  }

  @override
  Future<UserBody> updateUser(int userId, UserBody body) {
    return apiClient.updateUser(userId, body);
  }
}
