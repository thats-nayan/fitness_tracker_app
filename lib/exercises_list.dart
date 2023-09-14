
import 'package:flutter/material.dart';
import 'package:fitness_tracker/model/exercise.dart';
import 'package:fitness_tracker/exercise_item.dart';
class ExercisesList extends StatelessWidget{
  const ExercisesList({super.key,required this.exerciseList,required this.onRemoveExercise});
  final List <Exercise> exerciseList;
  final void Function(Exercise) onRemoveExercise;
 @override
  Widget build(context){
   return ListView.builder(itemCount: exerciseList.length,itemBuilder: (ctx,index) =>
       Dismissible(key: ValueKey(exerciseList[index]),
           onDismissed: (direction){
             onRemoveExercise(exerciseList[index]);
           },
           child: ExerciseItem(exercise:exerciseList[index])));
 }
}