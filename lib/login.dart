import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './elements.dart';

/// ## this is class login
/// this holds the login page
/// with the elements:
/// * email input
/// * password input
///   - with default password visibility off
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(  
      builder: (context, globalVars, child) {
        return Scaffold(
          backgroundColor: globalVars.colours.secondaryBackground,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Hero( //logo
                    tag: 'haas img',
                    child: Image.asset(
                      'assets/images/haas.ico',
                      width: globalVars.deviceInfo.screenDimension * 0.8,
                      height: globalVars.deviceInfo.screenDimension * 0.8,
                    ),
                  ),
                  myEmailInput(globalVars),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: SizedBox(
                      width: globalVars.deviceInfo.screenDimension * 0.82,
                      child: TextFormField(
                        autofocus: true,
                        autofillHints: const [AutofillHints.password],
                        obscureText: passwordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordVisibility ? 
                              Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: globalVars.colours.secondaryText,
                              size: 25.0,
                            ),
                          ),
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
                  ),
                  myNavButton(
                    context,
                    globalVars,
                    'HomePage',
                    'Login',
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
