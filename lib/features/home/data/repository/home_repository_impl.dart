import 'dart:io';

import 'package:app/config/http/api_service.dart';
import 'package:app/features/home/data/source/local/dao/user_dao.dart';
import 'package:app/features/home/data/source/local/entity/user_entity.dart';
import 'package:app/features/home/domain/model/user.dart';
import 'package:app/features/home/domain/repository/home_repository.dart';
import 'package:app/util/resource/data_state.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeRepositoryImpl implements HomeRepository {
  UserDao get _userDao => Get.find();
  ApiService get _apiService => Get.find();

  @override
  Future<DataState<List<User>>> getUsers() async {
    try {
      final httpResponse = await _apiService.getUsersFromApi();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final users = httpResponse.data.map((userDto) => userDto.toUser()).toList();
        return DataSuccess(users);
      } else {
        return DataError(_dioException(httpResponse));
      }
    } on DioException catch (exception) {
      return DataError(_dioException(exception));
    }
  }

  @override
  Future<DataState<List<User>>> getUsersFromLocal() async {
    List<UserEntity> users = await _userDao.getUsers();
    return DataSuccess(users);
  }

  @override
  Future<void> insertUsers(List<User> users) async {
    final userEntities = users.map((user) => user.toUserEntity()).toList();

    await _userDao.insertUsers(userEntities);
  }

  DioException _dioException(httpResponse) {
    return DioException.badResponse(
      statusCode: httpResponse.response.statusCode ?? 0,
      requestOptions: httpResponse.response.requestOptions,
      response: httpResponse.response,
    );
  }
}
