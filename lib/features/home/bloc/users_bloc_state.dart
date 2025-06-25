import 'package:flutter_test_bloc/features/home/model/user.dart';

sealed class UsersBlocState {}

class UsersBlocStateLoading extends UsersBlocState {}

class UsersBlocStateLoaded extends UsersBlocState {
  final List<User> users;

  UsersBlocStateLoaded(this.users);
}

class UsersBlocStateError extends UsersBlocState {
  final String error;

  UsersBlocStateError(this.error);
}
