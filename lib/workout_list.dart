import 'package:fitness_tracker/workout_item.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/model/workout.dart';

class WorkoutList extends StatelessWidget{
  const WorkoutList({super.key,required this.workouts,required this.onRemoveWorkout});
  final List <Workout> workouts;
  final void Function (Workout) onRemoveWorkout;
  @override
  Widget build(context){
    return ListView.builder(itemCount: workouts.length,
        itemBuilder: (ctx,index)=> WorkoutItem(workouts[index],onRemoveWorkout));
  }
}