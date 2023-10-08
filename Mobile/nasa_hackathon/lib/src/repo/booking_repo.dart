// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nasa_hackathon/src/models/booking_history.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';

class BookingRepo {
  final IPackageRepo repo;

  BookingRepo({
    required this.repo,
  });

  List<BookingHistory> history = [];

  Future<void> book(String packageId) async {
    final packages = await repo.fetchPackages();
    final package = packages.where((e) => e.id == packageId).first;
    history.add(BookingHistory(package: package, bookedDate: DateTime.now()));
  }

  Future<List<BookingHistory>> fetchHistory() async {
    return history;
  }
}
