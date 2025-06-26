import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/auth/cubit/auth_cubit_state.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthBlocState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthBlocStateInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthBlocStateLoading());
    try {
      final success = await authRepository.login(email, password);
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
