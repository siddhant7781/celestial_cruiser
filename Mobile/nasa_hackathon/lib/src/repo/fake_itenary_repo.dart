import 'package:nasa_hackathon/src/models/itenary.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';

class FakeItenaryRepo implements IItenaryRepo {
  @override
  Future<List<Itenary>> fetchItenaries(String packageId) async {
    return [
      Itenary(
        id: "1",
        startTime: "10:00",
        description: "Arrival to the Space Station",
      ),
      Itenary(
        id: "1",
        startTime: "10:10",
        description: "Entry to the main spaceship",
      ),
      Itenary(
        id: "1",
        startTime: "10:30",
        description: "Guide starts to inform rules of the spaceship",
      ),
      Itenary(
        id: "1",
        startTime: "11:00",
        description: "Prepare the fly off",
      ),
      Itenary(
        id: "1",
        startTime: "11:00",
        description: "Moon Landing",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Enjoy the view from the moon",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Trampoline like jumps in the moon",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Get back to the spaceship",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Journey to Mars",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Roam around the inhabited area of Mars",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Get back to the spaceship",
      ),
      Itenary(
        id: "1",
        startTime: "11:10",
        description: "Journey back to Earth",
      ),
    ];
  }
}
