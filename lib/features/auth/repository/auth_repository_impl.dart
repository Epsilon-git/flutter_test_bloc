import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return (email == 'user@test.com' && password == 'password123');
  }
}
