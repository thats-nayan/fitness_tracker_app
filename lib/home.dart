
import 'package:fitness_tracker/main_screen.dart';
import 'package:flutter/material.dart';
import "package:fitness_tracker/start_screen.dart";

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  var activeScreen = "start-screen";
  void onStart(){
    setState(() {
      activeScreen = 'main-screen';
    });
  }
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(onStart);
    if(activeScreen == "main-screen")
    {
        screenWidget = const MainScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromRGBO(120, 115, 115, 0.41),
          child: screenWidget,
        ),
      ),
    );
  }
}