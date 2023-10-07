import '../../models/itenary.dart';

abstract interface class IItenaryRepo {
  Future<List<Itenary>> fetchItenaries(String packageId);
}
