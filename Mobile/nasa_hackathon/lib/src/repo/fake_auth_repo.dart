import 'package:nasa_hackathon/src/repo/interface/iauth_repo.dart';
import 'package:warped_bloc/exceptions/default_failure.dart';

class FakeAuthRepo implements IAuthRepo {
  @override
  Future<String> login(String email, password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'me@me.com' && password == "me") {
      return "token";
    }

    throw const DefaultFailure("Invalid Credentials");
  }

  @override
  Future<void> register(String username, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
