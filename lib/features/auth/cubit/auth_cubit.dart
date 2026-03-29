import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/auth/cubit/auth_cubit_state.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthCubitStateInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthCubitStateLoading());
    try {
      final success = await authRepository.login(email, password);
      if (success) {
        emit(AuthCubitStateSuccess());
      } else {
        emit(AuthCubitStateFailure("Неверный логин или пароль"));
      }
    } catch (e) {
      emit(AuthCubitStateFailure("Ошибка авторизации: $e"));
    }
  }
}
