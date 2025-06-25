sealed class AuthBlocState {}

class AuthBlocStateInitial extends AuthBlocState {}

class AuthBlocStateLoading extends AuthBlocState {}

class AuthBlocStateSuccess extends AuthBlocState {}

class AuthBlocStateFailure extends AuthBlocState {
  final String message;
  AuthBlocStateFailure(this.message);
}
