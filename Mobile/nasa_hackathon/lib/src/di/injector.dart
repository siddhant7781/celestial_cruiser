import 'package:dio/dio.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';

import './cubit_injector.dart';
import './repo_injector.dart';
import './interactor_injector.dart';

Future<void> injectDependencies() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: "",
    ),
  );

  g.registerSingleton(dio);

  injectRepos();
  injectInteractors();
  injectCubits();
}
