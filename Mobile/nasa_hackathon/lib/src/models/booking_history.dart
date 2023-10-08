// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/models/package.dart';

class BookingHistory {
  final Package package;
  final DateTime bookedDate;

  BookingHistory({
    required this.package,
    required this.bookedDate,
  });
}
