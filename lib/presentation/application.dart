import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../data/datasources/remoute/remote_data_source.dart';
import '../data/repositories/launch_repository_impl.dart';
import '../data/repositories/rocket_repository_impl.dart';
import 'cubit/home/home_cubit.dart';
import 'navigation/navigation.dart';
import 'theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'TBR test task';

  final RemoteDataSourceImpl remoteDataSource = RemoteDataSourceImpl(
    client: http.Client(),
    uri: 'https://api.spacexdata.com/v3',
  );

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            launchRepository: LaunchRepositoryImpl(
              remoteDataSource: remoteDataSource,
            ),
            rocketRepository: RocketRepositoryImpl(
              remoteDataSource: remoteDataSource,
            ),
          )..init(),
        ),
      ],
      child: MaterialApp(
        title: _title,
        theme: AppTheme().theme,
        debugShowCheckedModeBanner: false,
        initialRoute: Navigation.initialRoute,
        routes: Navigation.routes,
      ),
    );
  }
}
