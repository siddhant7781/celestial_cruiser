// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/repo/interface/itoken_repo.dart';
import 'package:warped_bloc/warped_bloc.dart';

import '../repo/interface/iauth_repo.dart';

class LoginSuccess extends DataState<String> {
  const LoginSuccess({required super.data});
}

class LoginCubit extends AsyncCubit {
  final IAuthRepo repo;
  final ITokenRepo tokenRepo;

  LoginCubit({
    required this.repo,
    required this.tokenRepo,
  });

  login(String username, String password) {
    handleDefaultStates(() async {
      final token = await repo.login(username, password);
      await tokenRepo.saveToken(token);
      emit(const LoginSuccess(data: ""));
    });
  }
}
