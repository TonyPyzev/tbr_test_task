import '../../domain/entities/launch.dart';

class LaunchModel {
  final String missionName;
  final String siteNameLong;
  final DateTime launchDate;
  final String wikipedia;

  LaunchModel({
    required this.missionName,
    required this.siteNameLong,
    required this.launchDate,
    required this.wikipedia,
  });

  Launch toEntity() {
    return Launch(
      missionName: missionName,
      siteNameLong: siteNameLong,
      launchDate: launchDate,
      wikipedia: wikipedia,
    );
  }

  factory LaunchModel.fromMap(Map<String, dynamic> map) {
    return LaunchModel(
      missionName: map['mission_name'] as String,
      siteNameLong: map['launch_site']['site_name_long'] as String,
      launchDate: DateTime.parse(map['launch_date_local'] as String),
      wikipedia: map['links']['wikipedia'] == null
          ? ''
          : map['links']['wikipedia'] as String,
    );
  }
}
