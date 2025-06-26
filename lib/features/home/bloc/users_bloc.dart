import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/home/bloc/users_bloc_state.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';

class UsersBloc extends Cubit<UsersBlocState> {
  final UsersRepository usersRepository;

  UsersBloc({required this.usersRepository}) : super(UsersBlocStateLoading()) {
    onFetch();
  }

  Future<void> onFetch() async {
    final usersRes = await usersRepository.fetchUsers();
    if (usersRes.$2 == null) {
      emit(UsersBlocStateLoaded(usersRes.$1!));
    } else {
      emit(UsersBlocStateError(usersRes.$2!));
    }
  }

  Future<void> onRefresh() async {
    emit(UsersBlocStateLoading());

    onFetch();
  }
}
