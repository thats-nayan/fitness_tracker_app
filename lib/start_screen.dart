import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.onClick,{super.key});
  final void Function() onClick;
  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/saitama.png"),
          const Column(
            children: [
              Text("Your Fitness ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
              Text("Tracker ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            ],
          ),
          const Column(
            children: [
              Text("Track your daily workout and watch",style: TextStyle(fontSize: 15,)),
              Text("your progress",style: TextStyle(fontSize: 15)),
            ],
          ),
        ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
        ),
        child: const Text("Get Started" , textAlign: TextAlign.center,),
    )
       ]
      )
    );
  }
}