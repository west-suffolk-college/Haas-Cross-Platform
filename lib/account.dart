import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'elements.dart';
import 'main.dart' ;

/// 
class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalVars>(
      builder: (context, globalVars, child) {
        return Scaffold(
          backgroundColor: globalVars.colours.primaryBackground,
          appBar: myAppBar(context, globalVars),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  myNavButton(
                    context,
                    globalVars,
                    'Login',
                    'Sign out',
                  )
                ],
              ),
            ),
          )
        ); 
      }
    );
  }
}
