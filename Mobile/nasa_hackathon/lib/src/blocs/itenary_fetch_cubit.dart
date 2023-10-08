// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/models/itenary.dart';
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';

class ItenaryFetchLoaded extends DataState<List<Itenary>> {
  const ItenaryFetchLoaded({required super.data});
}

class ItenaryFetchCubit extends AsyncCubit {
  final IItenaryRepo repo;
  ItenaryFetchCubit({
    required this.repo,
  });

  fetch(String packageId) {
    handleDefaultStates(() async {
      print('----- fetch itenary');
      final data = await repo.fetchItenaries(packageId);
      emit(ItenaryFetchLoaded(data: data));
    });
  }
}
