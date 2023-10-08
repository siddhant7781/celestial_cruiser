// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/models/booking_history.dart';
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/repo/booking_repo.dart';

class BookingHistoryLoaded extends DataState<List<BookingHistory>> {
  const BookingHistoryLoaded({required super.data});
}

class BookingHistoryCubit extends AsyncCubit {
  final BookingRepo repo;
  BookingHistoryCubit({
    required this.repo,
  });

  fetch() {
    handleDefaultStates(() async {
      final data = await repo.fetchHistory();
      emit(BookingHistoryLoaded(data: data));
    });
  }
}
