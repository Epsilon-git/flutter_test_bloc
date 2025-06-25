abstract class AuthBlocEvent {}

class AuthBlocEventLoginRequested extends AuthBlocEvent {
  final String email;
  final String password;

  AuthBlocEventLoginRequested(this.email, this.password);
}
