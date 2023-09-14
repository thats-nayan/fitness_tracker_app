
import 'package:fitness_tracker/exercises_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/model/workout.dart';

class WorkoutItem extends StatelessWidget{
  const WorkoutItem(this.workout,this.removeWorkout,{super.key});
  final void Function(Workout) removeWorkout;
  final Workout workout;
  @override
  Widget build(context){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child:ElevatedButton(
        onPressed: (){
          showModalBottomSheet(isScrollControlled: true,context: context,builder: (ctx)=> ExercisesScreen(workout));
        },
        style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
    )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.fitness_center_rounded)),
        Text(workout.workoutName , textAlign: TextAlign.center,),
        IconButton(onPressed: (){removeWorkout(workout);}, icon:const Icon(Icons.delete,color: Colors.red,)),
      ],
    )
    )
    );
  }
}