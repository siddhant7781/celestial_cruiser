// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:nasa_hackathon/src/models/package.dart';
import 'package:nasa_hackathon/src/repo/interface/ipackage_repo.dart';

class PackageRepo implements IPackageRepo {
  final Dio dio;
  PackageRepo({
    required this.dio,
  });

  @override
  Future<List<Package>> fetchPackages() async {
    return [];
  }
}
