import 'package:fitness_tracker/model/exercise.dart';
import 'package:flutter/material.dart';

class NewExercise extends StatefulWidget{
  const NewExercise(this.addExercise,{super.key});
  final void Function(Exercise) addExercise;
  @override
  State<NewExercise> createState() {
    return _NewExerciseState();
  }
}

class _NewExerciseState extends State <NewExercise> {
  final _exerciseName = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _weightsController = TextEditingController();
  void validateExercise(){
      final enteredSets = double.tryParse(_setsController.text);
      final enteredReps = double.tryParse(_repsController.text);
      final enteredWeights = double.tryParse(_weightsController.text);
      final isInValidInput = enteredSets == null || enteredSets <= 0 || enteredReps == null || enteredReps <= 0
          || enteredWeights == null || enteredWeights <= 0 || _exerciseName.text.trim().isEmpty;
      if(isInValidInput){
        showDialog(context: context, builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Enter valid value"),
          actions: [
            TextButton(onPressed: (){Navigator.pop(ctx);}, child: const Text("Okay"))
          ],
        )
        );
        return ;
      }
      widget.addExercise(Exercise(exerciseName: _exerciseName.text,sets: int.tryParse(_setsController.text)!,
          reps:  int.tryParse(_repsController.text)!,weights: enteredWeights));
      Navigator.pop(context);
  }
  @override
  Widget build(context){
    return Center(
        child:Container(
            width: 300,
            height: 450,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                    child:Material(
                      color: Colors.grey,
                      child:
                      TextField(
                        controller: _exerciseName,
                        maxLength: 50,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            label: Text("Add new exercise")
                        ),
                      ),
                    )
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                    child:Material(
                      color: Colors.grey,
                      child:
                      TextField(
                        controller: _setsController,
                        keyboardType: TextInputType.number,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            label: Text("Add no of sets")
                        ),
                      ),
                    )
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                    child:Material(
                      color: Colors.grey,
                      child:
                      TextField(
                        controller: _repsController,
                        keyboardType: TextInputType.number,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            label: Text("Add no of reps")
                        ),
                      ),
                    )
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                    child:Material(
                      color: Colors.grey,
                      child:
                      TextField(
                        controller: _weightsController,
                        keyboardType: TextInputType.number,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            suffixText: "kgs",
                            label: Text("Add weight")
                        ),
                      ),
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: validateExercise, style: ElevatedButton.styleFrom(backgroundColor: Colors.black),child: const Text("Save"), ),
                    ElevatedButton(onPressed: (){Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text("Cancel")),
                  ],
                )
              ],
            )
        )
    );
  }
}