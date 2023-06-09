import '../../domain/entities/rocket.dart';

class RocketModel {
  final String rocketId;
  final String rocketName;
  final String wikipedia;
  final List<String> imageUrls;

  RocketModel({
    required this.rocketId,
    required this.rocketName,
    required this.wikipedia,
    required this.imageUrls,
  });

  Rocket toEntity() {
    return Rocket(
      rocketId: rocketId,
      rocketName: rocketName,
      wikipedia: wikipedia,
      imageUrls: imageUrls,
    );
  }

  factory RocketModel.fromMap(Map<String, dynamic> map) {
    return RocketModel(
      rocketId: map['rocket_id'] as String,
      rocketName: map['rocket_name'] as String,
      wikipedia: map['wikipedia'] as String,
      imageUrls: List<String>.from((map['flickr_images'] as List<dynamic>)),
    );
  }
}
