import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tbr_test_task/core/constants/app_colors.dart';
import 'package:tbr_test_task/core/constants/app_paddings.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  late final List<Widget> imageSliders;
  final List<String> imgList = [
    'assets/images/slider/image48.png',
    'assets/images/slider/image49.png',
    'assets/images/slider/image50.png',
    'assets/images/slider/image51.png',
  ];

  int _currentSlide = 0;

  @override
  void initState() {
    imageSliders = _buildImageSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPaddings.big,
              ),
              child: Center(
                child: Text(
                  'SpaceX Launches',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            CarouselSlider(
              items: imageSliders,
              carouselController: _carouselController,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(
                    top: AppPaddings.regular,
                    right: AppPaddings.tiny,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSlide == entry.key
                        ? AppColors.elements
                        : Colors.transparent,
                    border: Border.all(
                      color: AppColors.elements,
                      width: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPaddings.big,
                left: AppPaddings.medium,
              ),
              child: Text(
                'Missions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: AppPaddings.medium,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //TODO open wiki page
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: AppPaddings.medium,
                        right: AppPaddings.medium,
                        bottom: AppPaddings.small,
                      ),
                      padding: const EdgeInsets.all(
                        AppPaddings.medium,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.fill,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '04/06/2010',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.accent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: AppPaddings.tiny / 2),
                                Text(
                                  '06:34 PM',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Starlink Group 2-10',
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                                const SizedBox(height: AppPaddings.tiny / 2),
                                Text(
                                  'Kwajalein Atoll Omelek Island',
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildImageSliders() {
    return imgList
        .map((item) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: 1500,
              ),
            ))
        .toList();
  }
}
