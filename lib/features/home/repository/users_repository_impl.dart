import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test_bloc/features/home/model/user.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  final Dio dio;

  UsersRepositoryImpl(this.dio);

  @override
  Future<(List<User>?, String?)> fetchUsers() async {
    try {
      final res = await dio.get('/?results=100');

      if (res.statusCode == HttpStatus.ok) {
        final rawUsers = res.data['results'] as List<dynamic>;

        final users =
            rawUsers.map((rawUser) => User.fromJson(rawUser)).toList();

        return (users, null);
      }

      return (
        null,
        'Network error: status code: ${res.statusCode} data: ${res.data}',
      );
    } catch (e) {
      return (null, 'Network error: $e');
    }
  }
}
