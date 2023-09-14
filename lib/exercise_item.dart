import 'package:fitness_tracker/model/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget{
  const ExerciseItem({super.key,required this.exercise});
  final Exercise exercise;
  @override
  Widget build(context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: const Color.fromRGBO(173, 216, 230, 1),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                Text(exercise.exerciseName),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text("${exercise.weights.toStringAsFixed(2)} kgs"),
                    // Spacer takes all the space between
                    const Spacer(),
                    Row(
                      children: [
                        Text("Sets ${exercise.sets.toString()}"),
                        const SizedBox(width: 8,),
                        Text("Reps ${exercise.reps.toString()}"),
                      ],
                    )
                  ],
                )
              ],
            )
        )
    );
  }
}