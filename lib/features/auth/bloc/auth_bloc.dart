import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/auth/bloc/auth_bloc_event.dart';
import 'package:flutter_test_bloc/features/auth/bloc/auth_bloc_state.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthBlocStateInitial()) {
    on<AuthBlocEventLoginRequested>(_login);
  }

  Future<void> _login(
    AuthBlocEventLoginRequested event,
    Emitter<AuthBlocState> emit,
  ) async {
    emit(AuthBlocStateLoading());
    try {
      final success = await authRepository.login(event.email, event.password);
      if (success) {
        emit(AuthBlocStateSuccess());
      } else {
        emit(AuthBlocStateFailure("Неверный логин или пароль"));
      }
    } catch (e) {
      emit(AuthBlocStateFailure("Ошибка авторизации: $e"));
    }
  }
}
