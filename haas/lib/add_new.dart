import 'package:flutter/material.dart';
import './main.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});
  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colours['sec-bg'],
        iconTheme: IconThemeData(color: colours['pri']),
        automaticallyImplyLeading: true,
        centerTitle: false,
        elevation: 2.0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Add A New Machine',
            style: TextStyle(
              fontFamily: font,
              color: colours['pri-txt'],
              fontSize: fontSize+8.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
      ),
      backgroundColor: colours['pri-bg'],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Features comming soon',
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: fontSize,
                        letterSpacing: lineSpace,
                        fontWeight: FontWeight.w500,
                        color: colours['pri-txt']!,
                      ),
                    ),
                  ]
                )
              )
            ],
          ),
        ),
      ),
    ); 
  }
}