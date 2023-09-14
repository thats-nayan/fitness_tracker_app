import 'package:fitness_tracker/exercises_list.dart';
import 'package:fitness_tracker/model/workout.dart';
import 'package:fitness_tracker/new_exercise.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/model/exercise.dart';

class ExercisesScreen extends StatefulWidget{
  const ExercisesScreen(this.workout,{super.key});
  final Workout workout;
  @override
  State<ExercisesScreen> createState() {
     return _ExerciseScreenState();
  }
}
class _ExerciseScreenState extends State<ExercisesScreen>{
  void addNewExercise(Exercise ex){
    setState(() {
      widget.workout.exerciseList.add(ex);
    });
  }
  void addExercise(){
    showDialog(context: context, builder: (ctx) =>
        NewExercise(addNewExercise),
    );
  }
  void removeExercise(Exercise ex){
    setState(() {
      widget.workout.exerciseList.remove(ex);
    });
  }
  @override
  Widget build(context){
    Widget mainContent = widget.workout.exerciseList.isEmpty ?
    const Text("No exercises to display !! Start adding some")  :
    Expanded(child: ExercisesList(exerciseList: widget.workout.exerciseList,onRemoveExercise: removeExercise,),);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading:  BackButton(
            onPressed: (){Navigator.pop(context);},
          ),
          title: Padding(padding: const EdgeInsets.symmetric(vertical: 10),child: Text(widget.workout.workoutName,),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(child:Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromRGBO(120, 115, 115, 0.41),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mainContent,
              ],
            ),
          )
      )
    ),
        floatingActionButton: FloatingActionButton(onPressed: addExercise,foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
          ),
    )
    );
  }
}