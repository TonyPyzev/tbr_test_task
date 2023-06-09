import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../../core/failures/server_failure.dart';
import '../../domain/entities/launch.dart';
import '../../domain/repository/launch_repository.dart';
import '../datasources/remoute/remote_data_source.dart';

class LaunchRepositoryImpl implements LaunchRepository {
  final RemoteDataSource remoteDataSource;

  LaunchRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Launch>>> fetchLaunchesOfRocket(
      String rocketId) async {
    try {
      final launches = await remoteDataSource.fetchLaunchesOfRocket(rocketId);

      return Right(launches.map((e) => e.toEntity()).toList());
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
