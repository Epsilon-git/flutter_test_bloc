import 'package:flutter_test_bloc/features/home/model/user.dart';

sealed class UsersCubitState {}

class UsersCubitStateLoading extends UsersCubitState {}

class UsersCubitStateLoaded extends UsersCubitState {
  final List<User> users;

  UsersCubitStateLoaded(this.users);
}

class UsersCubitStateError extends UsersCubitState {
  final String error;

  UsersCubitStateError(this.error);
}
