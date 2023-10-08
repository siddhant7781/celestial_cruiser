import 'package:nasa_hackathon/src/models/package.dart';

abstract interface class IPackageRepo {
  Future<List<Package>> fetchPackages();
}
