import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

/// ## this is add new
/// this page as of writing this has no features
/// it is just a placeholder
/// this will have:
/// * add a new machine
/// * change its name
/// * set the location
/// * set who in team can view it and use it.
class AddNew extends StatefulWidget {
  const AddNew({super.key});
  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(
      builder: (context, globalVars, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: globalVars.colours.secondaryBackground,
            iconTheme: IconThemeData(color: globalVars.colours.primary),
            automaticallyImplyLeading: true,
            centerTitle: false,
            elevation: 2.0,
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Add A New Machine',
                style: TextStyle(
                  fontFamily: globalVars.fontInfo.font,
                  color: globalVars.colours.primaryText,
                  fontSize: globalVars.fontInfo.fontSizeMedium,
                  letterSpacing: 0.0,
                ),
              ),
            ),
          ),
          backgroundColor: globalVars.colours.primaryBackground,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Features coming soon',
                          style: TextStyle(
                            fontFamily: globalVars.fontInfo.font,
                            fontSize: globalVars.fontInfo.fontSizeMedium,
                            letterSpacing: globalVars.fontInfo.lineSpace,
                            fontWeight: FontWeight.w500,
                            color: globalVars.colours.primaryText,
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
    );
  }
}