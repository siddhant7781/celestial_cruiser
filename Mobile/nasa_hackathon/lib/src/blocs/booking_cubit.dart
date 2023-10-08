// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/repo/booking_repo.dart';

class BookingSuccess extends DataState<String> {
  const BookingSuccess({required super.data});
}

class BookingCubit extends AsyncCubit {
  final BookingRepo repo;
  BookingCubit({
    required this.repo,
  });

  book(String packageId) {
    handleDefaultStates(() async {
      await repo.book(packageId);
      emit(const BookingSuccess(data: "Booking Successs"));
    });
  }
}
