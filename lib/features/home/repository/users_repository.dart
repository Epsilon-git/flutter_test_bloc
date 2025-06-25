import 'package:flutter_test_bloc/features/home/model/user.dart';

abstract class UsersRepository {
  Future<(List<User>?, String?)> fetchUsers();
}
