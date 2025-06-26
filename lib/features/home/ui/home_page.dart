import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/core/di/di.dart';
import 'package:flutter_test_bloc/core/widgets/my_circular_progress_widget.dart';
import 'package:flutter_test_bloc/features/home/cubit/users_cubit.dart';
import 'package:flutter_test_bloc/features/home/cubit/users_cubit_state.dart';
import 'package:flutter_test_bloc/features/home/model/user.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';
import 'package:flutter_test_bloc/features/home/ui/widgets/user_info_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Пример Bloc')),
      body: BlocProvider<UsersCubit>(
        create: (_) => UsersCubit(usersRepository: di.get<UsersRepository>()),
        child: BlocBuilder<UsersCubit, UsersCubitState>(
          builder: (context, state) {
            return switch (state) {
              UsersCubitStateLoading _ => MyCircularProgressWidget(),
              UsersCubitStateLoaded state => _UsersList(users: state.users),
              UsersCubitStateError state => Center(child: Text(state.error)),
            };
          },
        ),
      ),
    );
  }
}

class _UsersList extends StatelessWidget {
  final List<User> users;

  const _UsersList({required this.users});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<UsersCubit>().onRefresh(),
      child: ListView.builder(
        itemBuilder: (_, index) => UserInfoRow(user: users[index]),
        itemCount: users.length,
      ),
    );
  }
}
