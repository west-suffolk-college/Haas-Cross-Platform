import 'package:flutter/material.dart';

Padding myNavButton(BuildContext context, String goto, String text, Map colours, String font, double fontSize, double lineSpace) {
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

AppBar myAppBar(BuildContext context, Map colours) {
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

