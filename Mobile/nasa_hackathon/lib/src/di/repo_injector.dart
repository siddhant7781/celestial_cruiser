import 'package:nasa_hackathon/src/di/env.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/repo/auth_repo.dart';
import 'package:nasa_hackathon/src/repo/booking_repo.dart';
import 'package:nasa_hackathon/src/repo/fake_auth_repo.dart';
import 'package:nasa_hackathon/src/repo/fake_itenary_repo.dart';
import 'package:nasa_hackathon/src/repo/fake_package_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/iauth_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';
import 'package:nasa_hackathon/src/repo/interface/itoken_repo.dart';
import 'package:nasa_hackathon/src/repo/itenary_repo.dart';
import 'package:nasa_hackathon/src/repo/package_repo.dart';
import 'package:nasa_hackathon/src/repo/prefs_token_repo.dart';

void injectRepos() {
  if (isDev) {
    _development();
  } else {
    _prod();
  }

  g.registerLazySingleton<ITokenRepo>(() => PrefsTokenRepo(prefs: g()));
}

_prod() {
  g.registerLazySingleton<IAuthRepo>(() => AuthRepo(dio: g()));
  g.registerLazySingleton<IPackageRepo>(() => PackageRepo(dio: g()));
  g.registerLazySingleton<IItenaryRepo>(() => ItenaryRepo(dio: g()));
  g.registerLazySingleton(
    () => BookingRepo(
      repo: g(),
    ),
  );
}

_development() {
  g.registerLazySingleton<IAuthRepo>(() => FakeAuthRepo());
  g.registerLazySingleton<IPackageRepo>(() => FakePackageRepo());
  g.registerLazySingleton<IItenaryRepo>(() => FakeItenaryRepo());
  g.registerLazySingleton(() => BookingRepo(repo: g()));
}
