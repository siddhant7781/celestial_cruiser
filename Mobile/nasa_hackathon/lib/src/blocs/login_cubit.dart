// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/repo/auth_repo.dart';

class LoginSuccess extends DataState<String> {
  const LoginSuccess({required super.data});
}

class LoginCubit extends AsyncCubit {
  final AuthRepo repo;

  LoginCubit({
    required this.repo,
  });

  login(String username, String password) {
    handleDefaultStates(() async {
      await repo.login(username, password);
      emit(const LoginSuccess(data: ""));
    });
  }
}
