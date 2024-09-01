import 'package:flutter/material.dart';
import 'package:haas/formulae.dart';
import './main.dart';


/// this is a nav button
/// this takes in:
/// * goto args which from root it will navigate to a page
/// * text which will be the name of the button displayed
Padding myNavButton(BuildContext context, GlobalVars globalVars, String goto, String text) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
    child: OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, goto);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(globalVars.colours.primary),
        side: WidgetStateProperty.all(BorderSide( color: globalVars.colours.secondary))
        ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: globalVars.fontInfo.font,
          fontSize: globalVars.fontInfo.fontSizeMedium+1,
          letterSpacing: globalVars.fontInfo.lineSpace,
          fontWeight: FontWeight.w500,
          color: globalVars.colours.primaryText,
        ),
      ),
    ),
  );
}

/// my app bar
/// has no args
/// but it will return the app bar that is used across most of the apps main pages.
AppBar myAppBar(BuildContext context, GlobalVars globalVars) {
  return AppBar(
    backgroundColor: globalVars.colours.secondaryBackground,
    iconTheme: IconThemeData(color: globalVars.colours.primaryText),
    automaticallyImplyLeading: false,
    flexibleSpace: FlexibleSpaceBar(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pushNamed(context, 'HomePage');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Haas.ico',
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconButton(
            color: globalVars.colours.primary,
            icon: Icon(
              Icons.person_outline,
              color: globalVars.colours.primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pushNamed(context, 'Account');
            },
          ),
          IconButton(
            color: globalVars.colours.primary,
            icon: Icon(
              Icons.settings_outlined,
              color: globalVars.colours.primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pushNamed(context, 'Settings');
            },
          ),
        ],
      ),
      centerTitle: true,
      expandedTitleScale: 1.0,
      titlePadding: const EdgeInsets.all(10.0),
    ),
    elevation: 5.0,
  );
}

/// this is for an email input
Padding myEmailInput(GlobalVars globalVars) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
    child: SizedBox(
      width: globalVars.deviceInfo.screenDimension * 0.82,
      child: TextFormField(
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontFamily: globalVars.fontInfo.font,
            fontSize: globalVars.fontInfo.fontSizeMedium,
            letterSpacing: globalVars.fontInfo.lineSpace,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: globalVars.colours.secondary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: globalVars.colours.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: globalVars.colours.error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: globalVars.colours.tertiary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: globalVars.colours.secondaryBackground,
        ),
        style: TextStyle(
          fontFamily: globalVars.fontInfo.font,
          fontSize: globalVars.fontInfo.fontSizeMedium,
          letterSpacing: globalVars.fontInfo.lineSpace,
          fontWeight: FontWeight.w500,
          color: globalVars.colours.primaryText,
        ),
      ),
    ),
  );
}

/// this is an automatic machine viewer for a machine passed in
Container myMachineViewer(BuildContext context, GlobalVars globalVars, Map machine) {
  Container cont = Container();
  if (machine['online']) {
    cont = onlineMachine(context, globalVars, machine);
  }
  else {
    cont = offlineMachine(machine, globalVars);
  }
  return Container(
    padding: EdgeInsetsDirectional.fromSTEB(0.0, globalVars.deviceInfo.screenHeight*0.05, 0.0, 16.0),
    color: globalVars.colours.primaryBackground,
    height: globalVars.deviceInfo.screenHeight*0.25,
    child: cont,
  );
}

/// this will return a a container if the machine is turned on
Container onlineMachine(BuildContext context, GlobalVars globalVars, Map machine) {
  return Container(
    color: globalVars.colours.accent,
    width: globalVars.deviceInfo.screenWidth*0.8,
    height: globalVars.deviceInfo.screenHeight*0.2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.factory_outlined,
              color: globalVars.colours.primaryText,
              size: globalVars.deviceInfo.screenHeight*0.07
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan( 
                    text: machine['name'],
                    style: TextStyle(
                      fontFamily: globalVars.fontInfo.font,
                      fontSize: globalVars.fontInfo.fontSizeExtraLarge,
                      letterSpacing: globalVars.fontInfo.lineSpace,
                      fontWeight: FontWeight.w500,
                      color: globalVars.colours.primary,
                    ),
                  ),
                ]
              )
            ),
            temperatureText(machine['temp'], globalVars),
            Icon(
              Icons.wifi_outlined,
              color: globalVars.colours.primaryText,
            ),
          ],
        ),
        progressBar(context, globalVars, machine['percentDone'])
      ]
    ),
  );
}

/// this will return a container for a machine that is offline
Container offlineMachine(Map machine, GlobalVars globalVars) {
  return Container(
    color: globalVars.colours.accent,
    width: globalVars.deviceInfo.screenHeight*0.8,
    height: globalVars.deviceInfo.screenHeight*0.2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.factory_outlined,
              color: globalVars.colours.primaryText,
              size: globalVars.deviceInfo.screenHeight*0.07
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan( 
                    text: machine['name'],
                    style: TextStyle(
                      fontFamily: globalVars.fontInfo.font,
                      fontSize: globalVars.fontInfo.fontSizeExtraLarge,
                      letterSpacing: globalVars.fontInfo.lineSpace,
                      fontWeight: FontWeight.w500,
                      color: globalVars.colours.primary,
                    ),
                  ),
                ]
              )
            ),
            Icon(
              Icons.wifi_off,
              color: globalVars.colours.error
            ),
          ],
        ),
      ]
    ),
  );
}

/// this is a progress bar indicator
Container progressBar(BuildContext context, GlobalVars globalVars, double progress) {
  double borderRadius = 10.0;
  Color col = globalVars.colours.primary;
  if (progress == 1) {
    col = globalVars.colours.success;
  }
  return Container(
    width: globalVars.deviceInfo.screenWidth*0.8,
    decoration: BoxDecoration(
      color: globalVars.colours.secondaryBackground,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: LinearProgressIndicator(
            value: progress,
            valueColor: AlwaysStoppedAnimation(col),
          ),
        ),
      ],
    ),
  );
}

/// this will return formatted text for the temperature
RichText temperatureText(double temp, GlobalVars globalVars) {
  double trueTemp = temperatureCalculator(temp, globalVars);
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$trueTemp°',
          style: TextStyle(
            fontFamily: globalVars.fontInfo.font,
            fontSize: globalVars.fontInfo.fontSizeExtraLarge,
            letterSpacing: globalVars.fontInfo.lineSpace,
            fontWeight: FontWeight.w500,
            color: getTempColour(temp, globalVars),
          ),
        ),
      ]
    )
  );
}

/// this gets the colour for the text in temp text.
Color getTempColour(double temp, GlobalVars globalVars) {
  if (temp > 100) {
    return globalVars.colours.error;
  }
  if (temp > 65) {
    return globalVars.colours.warning;
  }
  return globalVars.colours.success;
}