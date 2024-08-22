import 'package:flutter/material.dart';
import './elements.dart';
import './main.dart';
import 'updates.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    updateMachineInfo();
    return Scaffold(
      backgroundColor: colours['pri-bg'],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, 'AddNew');
        },
        mini: true,
        backgroundColor: colours['pri'],
        elevation: 8.0,
        child: Icon(
          Icons.add,
          color: colours['pri-txt'],
          size: 24.0,
        ),
      ),
      appBar: myAppBar(context),
      body: ListView.separated(
        itemCount: machineData.length,
        itemBuilder: (context, index) {
          return myMachineVeiwer(context, machineData[index]);
        },
        separatorBuilder: (context, index) => SizedBox(
          height: screenH*0.07
          ), // Adjust height as needed
      ),
    );
  }
}
