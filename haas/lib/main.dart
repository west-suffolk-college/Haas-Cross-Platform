import 'package:flutter/material.dart';

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

int screenDia = 0;

dynamic min(List nums) {
  var lowest = nums[0];
  for (var num in nums) {
    if (num < lowest) {
      lowest = num;
    }
  }
  return lowest;
}

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
    return MaterialApp(
      routes: {
        'Login': (context) => const Login(),
        'HomePage' : (context) => const HomePage(),
        'Account' : (context) => const Account(),
        'Settings' : (context) => const Settings(),
      },
      initialRoute: 'Login',
      debugShowCheckedModeBanner: false,
      title: 'My Haas',
      theme: ThemeData(
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours['sec-bg']!,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Hero( //logo
                tag: 'haas img',
                child: Image.asset(
                  'assets/images/haas.ico',
                  width: screenDia * 0.8,
                  height: screenDia * 0.8,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: screenDia * 0.82,
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
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
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      color: colours['pri-txt']!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: SizedBox(
                  width: screenDia * 0.82,
                  child: TextFormField(
                    autofocus: true,
                    autofillHints: const [AutofillHints.password],
                    obscureText: _passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
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
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _passwordVisibility ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: colours['sec-txt'],
                          size: screenDia * 0.045,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      color: colours['pri-txt']!,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: OutlinedButton(
                  onPressed: () async {
                    // Assuming your navigation uses Navigator.pushNamed
                    Navigator.pushNamed(context, 'HomePage');
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(colours['pri']!),
                    side: WidgetStateProperty.all(BorderSide( color: colours['sec']!))
                    ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      color: colours['pri-txt'],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(); 
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours['pri-bg'],
      appBar: myAppBar(context),
      body: const SingleChildScrollView(
        child: Center(
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours['pri-bg'],
      appBar: myAppBar(context),
    ); 
  }
}

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colours['pri-bg'],
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: OutlinedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, 'Login');
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(colours['pri']!),
                    side: WidgetStateProperty.all(BorderSide( color: colours['sec']!))
                    ),
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      color: colours['pri-txt'],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ); 
  }
}

void colourUpdate(bool isDark) {
  Map<String, Color> coloursBase = {
    'pri' :     const Color.fromRGBO(225, 0, 32, 1), //primairy
    'sec' :     const Color.fromARGB(206, 151, 00, 1), //secondairy
    'ter' :     const Color.fromRGBO(133, 6, 6, 1), //teriary
    'err' :     const Color.fromRGBO(221, 0, 16, 1), //error
    'wrn' :     const Color.fromRGBO(255, 93, 32, 1), //warning
    'suc' :     const Color.fromRGBO(17, 187, 48, 1), //success
    'alt' :     const Color.fromRGBO(52, 52, 52, 1), //alternitive
    'invis' :   const Color.fromRGBO(0, 0, 0, 0.0), //invisable
  };
  if (isDark) {
    coloursBase.addAll(
      const {
        'pri-txt' : Color.fromRGBO(255, 255, 255, 1), //primairy text
        'sec-txt' : Color.fromRGBO(149, 161, 172, 1), //secondairy text
        'pri-bg' :  Color.fromRGBO(34, 34, 34, 1), //primairy background
        'sec-bg' :  Color.fromRGBO(30, 30, 110, 1), //secondairy background
        'acc' :     Color.fromRGBO(25, 25, 109, 1), //accent
      }
    );
  }
  else {
    coloursBase.addAll(
      const {
        'pri-txt' : Color.fromRGBO(0, 0, 0, 1), //primairy text
        'sec-txt' : Color.fromRGBO(115, 115, 115, 1), //secondairy text
        'pri-bg' :  Color.fromRGBO(225, 225, 225, 1), //primairy background
        'sec-bg' :  Color.fromRGBO(60, 60, 220, 1), //secondairy background
        'acc' :     Color.fromRGBO(80, 80, 220, 1), //accent
      }
    );
  }
  colours = coloursBase;
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

