import 'package:flutter/material.dart';
import 'package:haas/formulars.dart';
import './main.dart';

Padding myNavButton(BuildContext context, String goto, String text) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
    child: OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, goto);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(colours['pri']!),
        side: WidgetStateProperty.all(BorderSide( color: colours['sec']!))
        ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: font,
          fontSize: fontSize+1,
          letterSpacing: lineSpace,
          fontWeight: FontWeight.w500,
          color: colours['pri-txt'],
        ),
      ),
    ),
  );
}

AppBar myAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: colours['sec-bg'],
    iconTheme: IconThemeData(color: colours['pri-txt']),
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
            color: colours['pri'],
            icon: Icon(
              Icons.person_outline,
              color: colours['pri-text'],
              size: 24.0,
            ),
            onPressed: () async {
              Navigator.pushNamed(context, 'Account');
            },
          ),
          IconButton(
            color: colours['pri'],
            icon: Icon(
              Icons.settings_outlined,
              color: colours['pri-text'],
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

Padding myEmailInput(){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
    child: SizedBox(
      width: screenDia * 0.82,
      child: TextFormField(
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontFamily: font,
            fontSize: fontSize,
            letterSpacing: lineSpace,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colours['sec']!,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colours['pri']!,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colours['err']!,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colours['ter']!,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: colours['pri-bg'],
        ),
        style: TextStyle(
          fontFamily: font,
          fontSize: fontSize,
          letterSpacing: lineSpace,
          fontWeight: FontWeight.w500,
          color: colours['pri-txt']!,
        ),
      ),
    ),
  );
}

Container myMachineVeiwer(BuildContext context,Map machine) {
  return Container(
    color: colours['acc'],
    width: screenH*0.8,
    height: screenH*0.4,
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.factory_outlined,
              color: colours['pri-txt'],
            ),
            tempritureText(machine['temp']),
          ],
        ),
        Row(
          children: [
            Icon(
              getIcon(machine['status']),
              color: colours['pri-txt'],
            ),
            progressBar(context, machine['percentDone'])
          ]
        )
      ],
    ),
  );
}

IconData getIcon(bool status) {
  if (status) {
    return Icons.wifi_outlined;
  }
  return Icons.wifi_off;
}

Container progressBar(BuildContext context, double progress) {
  double borderRadius = 10.0;
  return Container(
    height: 10.0,
    width: double.infinity, // Fills the available width
    decoration: BoxDecoration(
      color: colours['acc']!,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.transparent, // Removed redundant color
            valueColor: AlwaysStoppedAnimation(colours['pri']!),
          ),
        ),
      ],
    ),
  );
}

RichText tempritureText(double temp) {
  double trueTemp = tempritureCalculator(temp);
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$trueTemp',
          style: TextStyle(
            fontFamily: font,
            fontSize: fontSize+15.0,
            letterSpacing: lineSpace,
            fontWeight: FontWeight.w500,
            color: getTempColour(temp),
          ),
        ),
      ]
    )
  );
}

Color getTempColour(double temp) {
  if (temp > 100) {
    return colours['err']!;
  }
  if (temp > 65) {
    return colours['wrn']!;
  }
  return colours['suc']!;
}

