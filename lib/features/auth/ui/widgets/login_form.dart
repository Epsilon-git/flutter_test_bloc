import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/auth/cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.message = ''});

  final String message;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginPressed(BuildContext context) {
    context.read<AuthCubit>().login(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Пароль'),
          ),

          const SizedBox(height: 20),

          Text(widget.message, style: const TextStyle(color: Colors.red)),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => _onLoginPressed(context),
            child: const Text('Войти'),
          ),
        ],
      ),
    );
  }
}
