import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../entities/rocket.dart';
import '../repository/rocket_repository.dart';

class FetchRockets {
  final RocketRepository repository;

  FetchRockets({
    required this.repository,
  });

  Future<Either<Failure, List<Rocket>>> execute() async {
    return await repository.fetchRockets();
  }
}
