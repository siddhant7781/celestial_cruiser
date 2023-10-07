// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/models/package.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';
import 'package:warped_bloc/warped_bloc.dart';

class PackageFetchLoaded extends DataState<List<Package>> {
  const PackageFetchLoaded({required super.data});
}

class PackageFetchCubit extends AsyncCubit {
  final IPackageRepo repo;

  PackageFetchCubit({
    required this.repo,
  });

  fetch() {
    handleDefaultStates(() async {
      final data = await repo.fetchPackages();
      emit(PackageFetchLoaded(data: data));
    });
  }
}
