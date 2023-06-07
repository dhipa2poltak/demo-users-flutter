

import 'package:demo_users/data/models/response/user_list_response.dart';
import 'package:demo_users/data/models/response/user_response.dart';
import 'package:demo_users/data/models/user_body.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../app_config.dart';
import '../../locator/inject_container.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @factoryMethod
  static ApiClient create() {
    final dio = locator<Dio>();

    return ApiClient(dio, baseUrl: AppConfig.baseUrl);
  }

  @GET('api/users')
  Future<UserListResponse> getUserList(
    @Query("page") int page
  );

  @GET("api/users/{user_id}")
  Future<UserResponse> getUser(
    @Path("user_id") int userId,
  );

  @POST("api/users")
  Future<UserBody> createUser(
    @Body() UserBody userBody
  );

  @PUT("api/users/{user_id}")
  Future<UserBody> updateUser(
    @Path("user_id") int userId,
    @Body() UserBody userBody
  );

  @DELETE("api/users/{user_id}")
  Future<void> deleteUser(
    @Path("user_id") int userId,
  );
}
