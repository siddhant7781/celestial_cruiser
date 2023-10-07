import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/repo/auth_repo.dart';
import 'package:nasa_hackathon/src/repo/fake_itenary_repo.dart';
import 'package:nasa_hackathon/src/repo/fake_package_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';

void injectRepos() {
  g.registerLazySingleton(() => AuthRepo());
  g.registerLazySingleton<IPackageRepo>(() => FakePackageRepo());
  g.registerLazySingleton<IItenaryRepo>(() => FakeItenaryRepo());
}
