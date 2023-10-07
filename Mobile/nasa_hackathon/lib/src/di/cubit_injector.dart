import 'package:nasa_hackathon/src/blocs/itenary_fetch_cubit.dart';
import 'package:nasa_hackathon/src/blocs/login_cubit.dart';
import 'package:nasa_hackathon/src/blocs/package_fetch_cubit.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';

void injectCubits() {
  g.registerFactory(() => LoginCubit(repo: g()));
  g.registerFactory(() => PackageFetchCubit(repo: g()));
  g.registerFactory(() => ItenaryFetchCubit(repo: g()));
}
