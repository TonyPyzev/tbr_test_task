part of 'home_cubit.dart';

enum HomeStatus {
  allLoading,
  loadingLaunches,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Rocket> rockets;
  final List<Launch> launches;
  final int selectedRocketIndex;

  const HomeState({
    this.status = HomeStatus.allLoading,
    this.rockets = const [],
    this.launches = const [],
    this.selectedRocketIndex = 0,
  });

  @override
  List<Object> get props => [
        status,
        rockets,
        launches,
        selectedRocketIndex,
      ];

  HomeState copyWith({
    HomeStatus? status,
    List<Rocket>? rockets,
    List<Launch>? launches,
    int? selectedRocketIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      rockets: rockets ?? this.rockets,
      launches: launches ?? this.launches,
      selectedRocketIndex: selectedRocketIndex ?? this.selectedRocketIndex,
    );
  }
}
