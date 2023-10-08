// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:nasa_hackathon/src/models/itenary.dart';
import 'package:nasa_hackathon/src/repo/interface/iitenary_repo.dart';

class ItenaryRepo implements IItenaryRepo {
  final Dio dio;

  ItenaryRepo({
    required this.dio,
  });

  @override
  Future<List<Itenary>> fetchItenaries(String packageId) async {
    return [];
  }
}
