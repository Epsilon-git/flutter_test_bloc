import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/features/home/cubit/users_cubit_state.dart';
import 'package:flutter_test_bloc/features/home/repository/users_repository.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  final UsersRepository usersRepository;

  UsersCubit({required this.usersRepository})
    : super(UsersCubitStateLoading()) {
    onFetch();
  }

  Future<void> onFetch() async {
    final usersRes = await usersRepository.fetchUsers();
    if (usersRes.$2 == null) {
      emit(UsersCubitStateLoaded(usersRes.$1!));
    } else {
      emit(UsersCubitStateError(usersRes.$2!));
    }
  }

  Future<void> onRefresh() async {
    emit(UsersCubitStateLoading());

    onFetch();
  }
}
