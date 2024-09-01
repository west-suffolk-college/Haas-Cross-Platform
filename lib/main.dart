import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_new.dart';
import 'home_page.dart';
import 'login.dart';
import 'account.dart';
import 'settings.dart';
import 'formulae.dart';
import 'back_end.dart';

/// ## this is class colours, used for the app's colours
/// this contains a handful of features
/// 
/// it holds all the colours used in the app
/// 
/// it has two methods
/// * `switchToDark()`
///   - this switches the colours to dark mode theme
/// * `switchToLight()`
///   - vice versa for a light mode
/// 
/// the colours are all in RGB(O/A) format
/// 
/// the colours that available are
/// * `primary`
/// * `secondary`
/// * `tertiary`
/// * `error`
/// * `warning`
/// * `success`
/// * `alternative`
/// * `primaryText`
/// * `secondaryText`
/// * `primaryBackground`
/// * `secondaryBackground`
/// * `accent`
/// * `invisible`
class Colours {
  var primary = const Color.fromRGBO(225, 0, 32, 1);
  var secondary = const Color.fromRGBO(151, 00, 1, 1);
  var tertiary = const Color.fromRGBO(133, 6, 6, 1);
  var error = const Color.fromRGBO(221, 0, 16, 1);
  var warning = const Color.fromRGBO(255, 93, 32, 1);
  var success = const Color.fromRGBO(17, 187, 48, 1);
  var alternative = const Color.fromRGBO(52, 52, 52, 1);
  var primaryText = const Color.fromRGBO(255, 255, 255, 1);
  var secondaryText = const Color.fromRGBO(149, 161, 172, 1);
  var primaryBackground = const Color.fromRGBO(34, 34, 34, 1);
  var secondaryBackground = const Color.fromRGBO(30, 30, 110, 1);
  var accent = const Color.fromRGBO(25, 25, 109, 1);
  var invisible = const Color.fromRGBO(0, 0, 0, 0);

  void switchToLight() {
    alternative = const Color.fromARGB(255, 128, 127, 127);
    primaryText = const Color.fromARGB(255, 0, 0, 0);
    secondaryText = const Color.fromARGB(255, 66, 66, 66);
    primaryBackground = const Color.fromARGB(255, 255, 255, 255);
    secondaryBackground = const Color.fromARGB(255, 43, 43, 160);
    accent = const Color.fromARGB(255, 36, 36, 163);
  }
  void switchToDark() {
    alternative = const Color.fromARGB(255, 128, 127, 127);
    primaryText = const Color.fromARGB(255, 0, 0, 0);
    secondaryText = const Color.fromARGB(255, 66, 66, 66);
    primaryBackground = const Color.fromARGB(255, 255, 255, 255);
    secondaryBackground = const Color.fromARGB(255, 43, 43, 160);
    accent = const Color.fromARGB(255, 36, 36, 163);
  }
  void autoLightDark(Brightness modeTheme) {
    if (modeTheme == Brightness.dark) {
      switchToDark();
    }
    else if (modeTheme == Brightness.light) {
      switchToLight();
    }
  }
}

/// ## this is class device info
/// this holds a few properties of the device
/// 
/// it holds:
/// * `tempMode` a **string** of the temperature mode
/// * `screenDimension` an **int** of the screen dimension by minimum of height and width
/// * `screenHeight` an **int** of the screen height
/// * `screenWidth` an **int** of the screen width
class DeviceInfo {
  String tempMode = 'c';
  int screenDimension = 0;
  double screenHeight = 0;
  double screenWidth = 0;
}

/// ## this class hold Information about font
/// the attributes it holds are:
/// * `fontSize...` a **float** of the font size
///   - Extra large
///   - larger
///   - medium
///   - small
/// * `font` a **string** the font family to use
/// * `lineSpace` an **int** of the line spacing
class FontInfo {
  double fontSizeExtraLarge = 30.0;
  double fontSizeLarge = 22.0;
  double fontSizeMedium = 14.0;
  double fontSizeSmall = 8.0;
  String font = 'Plus Jakarta Sans';
  double lineSpace = 0.0;
}

class GlobalVars with ChangeNotifier {
  var colours = Colours();
  var deviceInfo = DeviceInfo();
  var fontInfo = FontInfo();
  String severIP = 'this a good ip';
  List<Map<String, dynamic>> machineData = talkBackend();

  void updateMachineData(List<Map<String, dynamic>> data) {
    machineData = data;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalVars(),
      child: const MyApp()
    ),
  );
}

/// ## this is the main app
/// this holds the whole app and inits the colours and other setting variables
/// this holds the root links for
/// * `Login`
/// * `HomePage`
/// * `Account`
/// * `Settings`
/// * `AddNew`
class MyApp extends StatelessWidget { 
  static const stringy = 'hello world';
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(
      builder: (context, globalVars, child) {
        globalVars.colours.autoLightDark(
          MediaQuery.platformBrightnessOf(context)
        );
        globalVars.deviceInfo.screenDimension = min(
          [
            MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ]
        );
        globalVars.deviceInfo.screenHeight = MediaQuery.of(context).size.height;
        globalVars.deviceInfo.screenWidth = MediaQuery.of(context).size.width;
        return MaterialApp(
          routes: {
            'Login': (context) => const Login(),
            'HomePage' : (context) => const HomePage(),
            'Account' : (context) => const Account(),
            'Settings' : (context) => const Settings(),
            'AddNew' : (context) => const AddNew(),
          },
          initialRoute: 'Login',
          debugShowCheckedModeBanner: false,
          title: 'My Haas',
          theme: ThemeData(
          ),
          home: const Login(),
        );
      },
    );
  }
}