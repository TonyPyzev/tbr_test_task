import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../../core/failures/server_failure.dart';
import '../../domain/entities/rocket.dart';
import '../../domain/repository/rocket_repository.dart';
import '../datasources/remoute/remote_data_source.dart';

class RocketRepositoryImpl implements RocketRepository {
  final RemoteDataSource remoteDataSource;

  RocketRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Rocket>>> fetchRockets() async {
    try {
      final rockets = await remoteDataSource.fetchRockets();

      return Right(rockets.map((e) => e.toEntity()).toList());
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
