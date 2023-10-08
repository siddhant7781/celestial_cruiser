// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:nasa_hackathon/src/repo/interface/iauth_repo.dart';

class AuthRepo implements IAuthRepo {
  final Dio dio;

  AuthRepo({
    required this.dio,
  });

  @override
  Future<String> login(String email, String password) async {
    final res = await dio.post('/users/login', data: {
      "email": email,
      "password": password,
    });

    return res.data['token'] as String;
  }

  @override
  Future<void> register(String username, String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
