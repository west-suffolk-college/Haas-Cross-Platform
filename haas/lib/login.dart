import 'package:flutter/material.dart';
import './main.dart';
import './elements.dart';

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
                      fontFamily: font,
                      fontSize: fontSize,
                      letterSpacing: lineSpace,
                      fontWeight: FontWeight.w500,
                      color: colours['pri-txt']!,
                    ),
                  ),
                ),
              ),
              myNavButton(
                context,
                'HomePage',
                'Login',
                colours,
                font,
                fontSize,
                lineSpace
              )
            ],
          ),
        ),
      ),
    );
  }
}
