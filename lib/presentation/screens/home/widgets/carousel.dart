import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../domain/entities/rocket.dart';
import '../../../cubit/home/home_cubit.dart';
import 'carousel_image.dart';

class Carousel extends StatelessWidget {
  final CarouselController carouselController;
  final List<Rocket> rockets;
  final int selectedRocketIndex;

  const Carousel({
    super.key,
    required this.carouselController,
    required this.rockets,
    required this.selectedRocketIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _buildImageSliders(rockets),
          carouselController: carouselController,
          options: CarouselOptions(
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            aspectRatio: 2,
            onPageChanged: (index, reason) {
              context.read<HomeCubit>().updateRocketIndex(index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            rockets.length,
            (index) => Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(
                top: AppPaddings.regular,
                right: AppPaddings.tiny,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedRocketIndex == index
                    ? AppColors.elements
                    : Colors.transparent,
                border: Border.all(
                  color: AppColors.elements,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildImageSliders(List<Rocket> rockets) {
    return rockets.map((rocket) => CarouselImage(rocket: rocket)).toList();
  }
}
