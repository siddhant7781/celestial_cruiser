import 'package:dio/dio.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/repo/interface/itoken_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './cubit_injector.dart';
import './repo_injector.dart';
import './interactor_injector.dart';

Future<void> injectDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  g.registerSingleton(prefs);

  final dio = Dio(
    BaseOptions(
      baseUrl:
          "https://d7b2-2001-df6-2380-43d8-2491-c0c-8a92-13fe.ngrok.io/api",
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await g<ITokenRepo>().fetchToken();
      if (token != null) {
        options.headers = {
          ...(options.headers),
          "Authorization": "Bearer $token",
        };
      }
      return handler.next(options);
    },
  ));

  g.registerSingleton(dio);

  injectRepos();
  injectInteractors();
  injectCubits();
}
