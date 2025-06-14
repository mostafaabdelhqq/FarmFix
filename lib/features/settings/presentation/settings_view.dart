import 'package:farmfix/constants.dart';
import 'package:farmfix/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: SingleChildScrollView(
          child: SettingsViewBody(),
        ),
      ),
    );
  }
}
