import 'package:either_dart/either.dart';

import '../../core/failures/failure.dart';
import '../entities/launch.dart';

abstract class LaunchRepository {
  Future<Either<Failure, List<Launch>>> fetchLaunchesOfRocket(String rocketId);
}
