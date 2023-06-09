import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../entities/launch.dart';
import '../repository/launch_repository.dart';

class FetchLaunches {
  final LaunchRepository repository;

  FetchLaunches({
    required this.repository,
  });

  Future<Either<Failure, List<Launch>>> execute(String rocketId) async {
    return await repository.fetchLaunchesOfRocket(rocketId);
  }
}
