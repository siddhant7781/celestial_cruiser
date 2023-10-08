import 'package:nasa_hackathon/src/blocs/booking_cubit.dart';
import 'package:nasa_hackathon/src/blocs/booking_history_cubit.dart';
import 'package:nasa_hackathon/src/blocs/itenary_fetch_cubit.dart';
import 'package:nasa_hackathon/src/blocs/login_cubit.dart';
import 'package:nasa_hackathon/src/blocs/package_fetch_cubit.dart';
import 'package:nasa_hackathon/src/blocs/register_cubit.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';

void injectCubits() {
  g.registerFactory(() => LoginCubit(repo: g(), tokenRepo: g()));
  g.registerFactory(() => RegisterCubit(repo: g()));
  g.registerFactory(() => PackageFetchCubit(repo: g()));
  g.registerFactory(() => ItenaryFetchCubit(repo: g()));
  g.registerFactory(() => BookingCubit(repo: g()));
  g.registerFactory(() => BookingHistoryCubit(repo: g()));
}
