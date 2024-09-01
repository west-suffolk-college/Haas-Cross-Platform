import 'package:flutter/material.dart';
import 'package:haas/back_end.dart';
import 'package:provider/provider.dart';
import './elements.dart';
import './main.dart';

/// ## this is the home page
/// this holds:
/// * the machine viewer
/// * the floating action button for adding a new machine
/// * the app bar to navigate to other pages
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}


/// ## this is the state of the home page
/// this holds:
/// * the machine viewer
/// * the floating action button for adding a new machine
/// * the app bar to navigate to other pages
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(
      builder: (context, globalVars, child) {
        globalVars.updateMachineData(talkBackend());
        return Scaffold(
          backgroundColor: globalVars.colours.primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.pushNamed(context, 'AddNew');
            },
            mini: true,
            backgroundColor: globalVars.colours.primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: globalVars.colours.primaryText,
              size: 24.0,
            ),
          ),
          appBar: myAppBar(context, globalVars),
          body: ListView.separated(
            itemCount: globalVars.machineData.length,
            itemBuilder: (context, index) {
              return myMachineViewer(context, globalVars, globalVars.machineData[index]);
            },
            separatorBuilder: (context, index) => SizedBox(
              height: globalVars.deviceInfo.screenHeight*0.07
              ), // Adjust height as needed
          ),
        );
      }
    );
  }
}
