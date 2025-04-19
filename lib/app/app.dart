import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_checker_app/core/networks/connectivity/connectivity_bloc.dart';
import 'package:internet_checker_app/feature/settings/presentation/screen/settings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SettingsScreen(),
      ),
    );
  }
}
