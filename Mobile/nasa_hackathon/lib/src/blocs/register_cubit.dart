// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/repo/interface/iauth_repo.dart';

class RegisterSuccess extends DataState<String> {
  const RegisterSuccess({required super.data});
}

class RegisterCubit extends AsyncCubit {
  final IAuthRepo repo;

  RegisterCubit({
    required this.repo,
  });

  register(String username, String email, String password) {
    handleDefaultStates(() async {
      await repo.register(username, email, password);
      emit(const RegisterSuccess(data: ""));
    });
  }
}
