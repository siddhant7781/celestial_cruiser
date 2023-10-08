import 'package:nasa_hackathon/src/models/itenary.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';

class FakeItenaryRepo implements IItenaryRepo {
  @override
  Future<List<Itenary>> fetchItenaries(String packageId) async {
    await Future.delayed(const Duration(seconds: 1));
    if (packageId == "1") {
      return _toMars();
    }
    return _toMoon();
  }

  List<Itenary> _toMars() {
    return [
      Itenary(
        id: "1",
        day: "1",
        items: [
          ItenaryItem(
            startTime: "10:00",
            description: "Arrival to the Space Station",
          ),
          ItenaryItem(
            startTime: "10:10",
            description: "Entry to the main spaceship",
          ),
          ItenaryItem(
            startTime: "10:30",
            description: "Guide starts to inform rules of the spaceship",
          ),
          ItenaryItem(
            startTime: "11:00",
            description: "Prepare the fly off",
          ),
          ItenaryItem(
            startTime: "11:00",
            description: "Landing on Space Hotel in the Moon",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Exploring Lunar caves",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Trampoline like jumps in the moon",
          ),
          ItenaryItem(
            startTime: "11:10",
            description:
                "Enjoy space-themed food with the most stunning scenaries of outer space",
          ),
        ],
      ),
      Itenary(
        id: '2',
        day: '2',
        items: [
          ItenaryItem(
            startTime: "11:10",
            description: "Light, Space themed Breakfast",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Journey to Mars",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Getting to Mars will be a 4 day trip",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "The Food will available at any point in time",
          ),
        ],
      ),
      Itenary(
        id: '6',
        day: '6',
        items: [
          ItenaryItem(
            startTime: "11:10",
            description: "Arrival at Mars",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Roam around the inhabited area of Mars",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Food will be available at any point in time",
          ),
        ],
      ),
      Itenary(
        id: '7',
        day: '7',
        items: [
          ItenaryItem(
            startTime: "11:10",
            description: "Light, Space themed Breakfast",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Explore Martian Rocks, Crater formations",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Food will be available at any point in time",
          ),
        ],
      ),
      Itenary(
        id: '8',
        day: '8',
        items: [
          ItenaryItem(
            startTime: "11:10",
            description: "Light, Space themed Breakfast",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Journey Back to Earth",
          ),
        ],
      ),
    ];
  }

  List<Itenary> _toMoon() {
    return [
      Itenary(
        id: "1",
        day: "1",
        items: [
          ItenaryItem(
            startTime: "10:00",
            description: "Arrival to the Space Station",
          ),
          ItenaryItem(
            startTime: "10:10",
            description: "Entry to the main spaceship",
          ),
          ItenaryItem(
            startTime: "10:30",
            description: "Guide starts to inform rules of the spaceship",
          ),
          ItenaryItem(
            startTime: "11:00",
            description: "Prepare the fly off",
          ),
          ItenaryItem(
            startTime: "11:00",
            description: "Landing on Space Hotel in the Moon",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Exploring Lunar caves",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Trampoline like jumps in the moon",
          ),
          ItenaryItem(
            startTime: "11:10",
            description:
                "Enjoy space-themed food with the most stunning scenaries of outer space",
          ),
        ],
      ),
      Itenary(
        id: '2',
        day: '2',
        items: [
          ItenaryItem(
            startTime: "11:10",
            description: "Light, Space themed Breakfast",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Exploring the museum like hotel",
          ),
          ItenaryItem(
            startTime: "11:10",
            description:
                "Observing celestial objects & astrophotography beyond space hotel",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Returning back to space hotel",
          ),
          ItenaryItem(
            startTime: "11:10",
            description: "Heading back to Earth",
          ),
        ],
      ),
    ];
  }
}
