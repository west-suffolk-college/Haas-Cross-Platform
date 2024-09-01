import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './elements.dart';

/// this will allow the user to change settings of the app
class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(
      builder: (context, globalVars, child) {
        return Scaffold(
          backgroundColor: globalVars.colours.primaryBackground,
          appBar: myAppBar(context, globalVars),
          body: const SingleChildScrollView(
            child: Center(
            )
          ),
        );
      }
    );
  }
}
