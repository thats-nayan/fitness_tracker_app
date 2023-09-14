import 'package:fitness_tracker/new_workout.dart';
import 'package:fitness_tracker/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/model/workout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final List <Workout> _allWorkouts = [
  ];
  void addNewWorkout(Workout wk){
    setState(() {
      _allWorkouts.add(wk);
    });
  }
  void removeWorkout(Workout workout){
    setState(() {
      _allWorkouts.remove(workout);
    });
  }
  void openAddWorkout() {
    showDialog(context: context, builder: (ctx) =>
        NewWorkout(addNewWorkout)
    );
  }
  void openWorkout(){

  }
  @override
  Widget build(context) {
    Widget mainContent;
    mainContent = _allWorkouts.isEmpty ? const Center(child:
    Text("No workouts to display . Start adding some !",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)):
    WorkoutList(workouts: _allWorkouts,onRemoveWorkout: removeWorkout);

    return
      Padding(padding: const EdgeInsets.fromLTRB(30,30,30,30),
      child:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Heat Map"),
          Expanded(child: mainContent,),
          FloatingActionButton(onPressed: openAddWorkout,
            child: const Icon(Icons.add),
          )
        ],
      ),
    )
      );
  }
}
