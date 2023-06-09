import 'package:equatable/equatable.dart';

class Launch extends Equatable {
  final String missionName;
  final String siteNameLong;
  final DateTime launchDate;
  final String wikipedia;

  const Launch({
    required this.missionName,
    required this.siteNameLong,
    required this.launchDate,
    required this.wikipedia,
  });

  @override
  List<Object> get props => [
        missionName,
        siteNameLong,
        launchDate,
        wikipedia,
      ];

  Launch copyWith({
    String? missionName,
    String? siteNameLong,
    DateTime? launchDate,
    String? wikipedia,
  }) {
    return Launch(
      missionName: missionName ?? this.missionName,
      siteNameLong: siteNameLong ?? this.siteNameLong,
      launchDate: launchDate ?? this.launchDate,
      wikipedia: wikipedia ?? this.wikipedia,
    );
  }
}
