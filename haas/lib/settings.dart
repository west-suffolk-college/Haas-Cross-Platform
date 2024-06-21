import 'package:flutter/material.dart';
import './main.dart';
import './elements.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours['pri-bg'],
      appBar: myAppBar(context),
      body: const SingleChildScrollView(
        child: Center(
        )
      ),
    );
  }
}
