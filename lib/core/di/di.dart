import 'package:dio/dio.dart';
import 'package:flutter_test_bloc/core/network/dio.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository_impl.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository_impl.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  di.registerSingleton<Dio>(dio);
  di.registerSingleton<UsersRepository>(UsersRepositoryImpl(di.get<Dio>()));

  di.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
