import 'package:nasa_hackathon/src/models/itenary.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';

class ItenaryRepo implements IItenaryRepo {
  @override
  Future<List<Itenary>> fetchItenaries(String packageId) async {
    return [];
  }
}
