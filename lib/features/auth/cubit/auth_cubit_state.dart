sealed class AuthCubitState {}

class AuthCubitStateInitial extends AuthCubitState {}

class AuthCubitStateLoading extends AuthCubitState {}

class AuthCubitStateSuccess extends AuthCubitState {}

class AuthCubitStateFailure extends AuthCubitState {
  final String message;
  AuthCubitStateFailure(this.message);
}
