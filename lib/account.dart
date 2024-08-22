import 'package:flutter/material.dart';
import './elements.dart';
import './main.dart';

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
              myNavButton(
                context,
                'Login',
                'Sign out',
              )
            ],
          ),
        ),
      )
    ); 
  }
}
