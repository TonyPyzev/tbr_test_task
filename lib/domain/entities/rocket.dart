import 'package:equatable/equatable.dart';

class Rocket extends Equatable {
  final String rocketId;
  final String rocketName;
  final String wikipedia;
  final List<String> imageUrls;

  const Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.wikipedia,
    required this.imageUrls,
  });

  @override
  List<Object> get props => [
        rocketId,
        rocketName,
        wikipedia,
        imageUrls,
      ];

  Rocket copyWith({
    String? rocketId,
    String? rocketName,
    String? wikipedia,
    List<String>? imageUrls,
  }) {
    return Rocket(
      rocketId: rocketId ?? this.rocketId,
      rocketName: rocketName ?? this.rocketName,
      wikipedia: wikipedia ?? this.wikipedia,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}
