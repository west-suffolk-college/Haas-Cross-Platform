import 'package:flutter/material.dart';
import 'package:haas/elements.dart';
import 'package:haas/main.dart';

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
      appBar: myAppBar(context, colours),
    ); 
  }
}
