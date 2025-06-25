import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/core/di/di.dart';
import 'package:flutter_test_bloc/core/widgets/my_circular_progress_widget.dart';
import 'package:flutter_test_bloc/features/home/bloc/users_bloc.dart';
import 'package:flutter_test_bloc/features/home/bloc/users_bloc_event.dart';
import 'package:flutter_test_bloc/features/home/bloc/users_bloc_state.dart';
import 'package:flutter_test_bloc/features/home/model/user.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';
import 'package:flutter_test_bloc/features/home/ui/widgets/user_info_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Пример Bloc')),
      body: BlocProvider<UsersBloc>(
        create: (_) => UsersBloc(usersRepository: di.get<UsersRepository>()),
        child: BlocBuilder<UsersBloc, UsersBlocState>(
          builder: (context, state) {
            return switch (state) {
              UsersBlocStateLoading _ => MyCircularProgressWidget(),
              UsersBlocStateLoaded state => _UsersList(users: state.users),
              UsersBlocStateError state => Center(child: Text(state.error)),
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
      onRefresh:
          () async => context.read<UsersBloc>().add(UsersBlocEventRefresh()),
      child: ListView.builder(
        itemBuilder: (_, index) => UserInfoRow(user: users[index]),
        itemCount: users.length,
      ),
    );
  }
}
