import 'package:nasa_hackathon/src/core/constants/assets.dart';
import 'package:nasa_hackathon/src/models/package.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';

class FakePackageRepo implements IPackageRepo {
  @override
  Future<List<Package>> fetchPackages() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Package(
        id: '1',
        name: "MARS",
        price: 1000000,
        distance: '225M',
        description:
            "Take your flight to Mars\nand enjoy this solar journey.\nYou will be flying for 12 Earth days with the\nshuttle SM-GF10, in totally\ncomfort and safety.",
        planetImage: Assets.mars,
      ),
      Package(
        id: '2',
        name: "MOON",
        price: 100000,
        distance: '384K',
        description:
            "Take your flight to Mars\nand enjoy this solar journey.\nYou will be flying for 3 Earth days with the\nshuttle SM-GF10, in totally\ncomfort and safety.",
        planetImage: Assets.moon,
      ),
    ];
  }
}
