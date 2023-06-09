import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../domain/entities/rocket.dart';

class CarouselImage extends StatelessWidget {
  final Rocket rocket;

  const CarouselImage({
    super.key,
    required this.rocket,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Stack(
        children: [
          Container(
            color: AppColors.fill,
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: rocket.imageUrls.first,
            width: 1500,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
