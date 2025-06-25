import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/core/di/di.dart';
import 'package:flutter_test_bloc/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_test_bloc/features/auth/bloc/auth_bloc_state.dart';
import 'package:flutter_test_bloc/features/auth/repository/auth_repository.dart';
import 'package:flutter_test_bloc/features/auth/ui/widgets/login_form.dart';
import 'package:flutter_test_bloc/core/widgets/my_circular_progress_widget.dart';
import 'package:flutter_test_bloc/features/home/ui/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизация')),
      body: BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(authRepository: di.get<AuthRepository>()),

        child: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is AuthBlocStateSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            }
          },

          builder: (context, state) {
            return switch (state) {
              AuthBlocStateInitial _ => LoginForm(),
              AuthBlocStateFailure state => LoginForm(message: state.message),
              AuthBlocStateLoading _ => MyCircularProgressWidget(),
              AuthBlocStateSuccess _ => const Center(
                child: Text('Успешный вход!'),
              ),
            };
          },
        ),
      ),
    );
  }
}
