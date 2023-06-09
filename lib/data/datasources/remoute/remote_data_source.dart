import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/launch_model.dart';
import '../../models/rocket_model.dart';

abstract class RemoteDataSource {
  Future<List<RocketModel>> fetchRockets();
  Future<List<LaunchModel>> fetchLaunchesOfRocket(String rocketId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String uri;

  RemoteDataSourceImpl({
    required this.client,
    required this.uri,
  });

  @override
  Future<List<RocketModel>> fetchRockets() async {
    final List<RocketModel> rockets = [];

    final responce = await client.get(Uri.parse('$uri/rockets'));

    if (responce.statusCode == 200) {
      final body = json.decode(responce.body);

      for (var element in body) {
        rockets.add(RocketModel.fromMap(element));
      }
      return rockets;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<LaunchModel>> fetchLaunchesOfRocket(String rocketId) async {
    final List<LaunchModel> launches = [];

    final responce =
        await client.get(Uri.parse('$uri/launches?rocket_id=$rocketId'));

    if (responce.statusCode == 200) {
      final body = json.decode(responce.body);

      for (var element in body) {
        launches.add(LaunchModel.fromMap(element));
      }
      return launches;
    } else {
      throw Exception();
    }
  }
}
