import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_paddings.dart';
import '../../cubit/home/home_cubit.dart';
import '../error/error_screen.dart';
import 'widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String pageRoute = '/';

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) => curr.status != prev.status,
      builder: (context, state) {
        if (state.status == HomeStatus.error) {
          return const ErrorScreen();
        }
        if (state.status == HomeStatus.allLoading) {
          return const Scaffold(
            body: LoadingIndicator(),
          );
        }
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
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Carousel(
                      carouselController: _carouselController,
                      rockets: state.rockets,
                      selectedRocketIndex: state.selectedRocketIndex,
                    );
                  },
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
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state.status == HomeStatus.loadingLaunches) {
                        return const LoadingIndicator();
                      }
                      if (state.launches.isEmpty) {
                        return Center(
                          child: Text(
                            'This rocket has not yet been launched',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.launches.length,
                        itemBuilder: (context, index) {
                          return LaunchListTile(
                            onTap: () {
                              _launchURL(state.launches[index].wikipedia);
                            },
                            launch: state.launches[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchURL(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      _showSnackBar("Can't open this link");
    }
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.fill,
      content: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ));
  }
}
