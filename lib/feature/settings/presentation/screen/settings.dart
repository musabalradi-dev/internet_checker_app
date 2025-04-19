import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_checker_app/core/networks/connectivity/connectivity_bloc.dart';
import 'package:internet_checker_app/feature/settings/presentation/widget/build_loading_state.dart';
import 'package:internet_checker_app/feature/settings/presentation/widget/build_no_connection_screen.dart';
import 'package:internet_checker_app/feature/settings/presentation/widget/build_settings_content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          // يمكن إضافة أي تفاعلات إضافية عند تغيير حالة الاتصال هنا
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              if (state is ConnectedState) {
                return buildSettingsContent();
              } else if (state is NoConnectedState) {
                return buildNoConnectionScreen(context);
              }
              return buildLoadingState();
            },
          ),
        ),
      ),
    );
  }

}