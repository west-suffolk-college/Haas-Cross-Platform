import 'package:flutter/material.dart';
import 'add_new.dart';
import 'home_page.dart';
import 'login.dart';
import 'account.dart';
import 'settings.dart';
import 'updates.dart';
import 'formulars.dart';

Map<String, Color> colours = const {
  'pri' :     Color.fromRGBO(225, 0, 32, 1), //primairy
  'sec' :     Color.fromARGB(206, 151, 00, 1), //secondairy
  'ter' :     Color.fromRGBO(133, 6, 6, 1), //teriary
  'err' :     Color.fromRGBO(221, 0, 16, 1), //error
  'wrn' :     Color.fromRGBO(255, 93, 32, 1), //warning
  'suc' :     Color.fromRGBO(17, 187, 48, 1), //success
  'alt' :     Color.fromRGBO(52, 52, 52, 1), //alternitive
  'pri-txt' : Color.fromRGBO(255, 255, 255, 1), //primairy text
  'sec-txt' : Color.fromRGBO(149, 161, 172, 1), //secondairy text
  'pri-bg' :  Color.fromRGBO(34, 34, 34, 1), //primairy background
  'sec-bg' :  Color.fromRGBO(30, 30, 110, 1), //secondairy background
  'acc' :     Color.fromRGBO(25, 25, 109, 1), //accent
  'invis' :   Color.fromRGBO(0, 0, 0, 0.0), //invisable
};

double fontSize = 14.0;
String font = 'Plus Jakarta Sans';
double lineSpace = 0.0;
String tempMode = 'c';
int screenDia = 0;
double screenH = 0;
double screenW = 0;

List<Map<String, dynamic>> machineData = const [
  {
    'name' : 'machy 1',
    'temp' : 90.0,
    'ID' : '18737620172',
    'percentDone' : 50,
    'online' : true
  },
  {
    'name' : 'john',
    'temp' : 30.0,
    'ID' : '18732630172',
    'percentDone' : 12,
    'online' : false
  }
];

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    colourUpdate(MediaQuery.platformBrightnessOf(context) == Brightness.dark);
    screenDia = min(
      [
        MediaQuery.of(context).size.height,
        MediaQuery.of(context).size.width,
      ]
    );
    screenH = MediaQuery.of(context).size.height;
    screenW = MediaQuery.of(context).size.width;
    return MaterialApp(
      routes: {
        'Login': (context) => const Login(),
        'HomePage' : (context) => const HomePage(),
        'Account' : (context) => const Account(),
        'Settings' : (context) => const Settings(),
        'AddNew' : (context) => const AddNew(),
      },
      initialRoute: 'HomePage',
      debugShowCheckedModeBanner: false,
      title: 'My Haas',
      theme: ThemeData(
      ),
      home: const Login(),
    );
  }
}

