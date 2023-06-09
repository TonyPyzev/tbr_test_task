import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../entities/rocket.dart';

abstract class RocketRepository {
  Future<Either<Failure, List<Rocket>>> fetchRockets();
}
