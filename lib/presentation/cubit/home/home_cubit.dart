import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../../../core/failures/failure.dart';
import '../../../domain/repository/launch_repository.dart';
import '../../../domain/repository/rocket_repository.dart';
import '../../../domain/usecases/fetch_launches.dart';
import '../../../domain/usecases/fetch_rockets.dart';
import '../../../domain/entities/launch.dart';
import '../../../domain/entities/rocket.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RocketRepository rocketRepository;
  final LaunchRepository launchRepository;

  HomeCubit({
    required this.rocketRepository,
    required this.launchRepository,
  }) : super(const HomeState());

  Future<void> init() async {
    await _fetchRockets();
    await _fetchLaunches(state.rockets[state.selectedRocketIndex].rocketId);

    emit(state.copyWith(
      status: HomeStatus.loaded,
    ));
  }

  void updateRocketIndex(int index) {
    emit(state.copyWith(
      selectedRocketIndex: index,
      status: HomeStatus.loadingLaunches,
    ));

    _fetchLaunches(state.rockets[index].rocketId);
  }

  Future<void> _fetchRockets() async {
    final Either<Failure, List<Rocket>> rockets = await FetchRockets(
      repository: rocketRepository,
    ).execute();

    if (rockets.isLeft) {
      emit(state.copyWith(
        status: HomeStatus.error,
      ));
    } else {
      emit(state.copyWith(
        rockets: rockets.right,
      ));
    }
  }

  Future<void> _fetchLaunches(String rocketId) async {
    final Either<Failure, List<Launch>> launches = await FetchLaunches(
      repository: launchRepository,
    ).execute(rocketId);

    if (launches.isLeft) {
      emit(state.copyWith(
        status: HomeStatus.error,
      ));
    } else {
      emit(state.copyWith(
        launches: launches.right,
        status: HomeStatus.loaded,
      ));
    }
  }
}
