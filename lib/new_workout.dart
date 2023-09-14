import 'package:fitness_tracker/model/workout.dart';
import 'package:flutter/material.dart';

class NewWorkout extends StatefulWidget{
  const NewWorkout(this.addNewWorkout,{super.key});
  final void Function(Workout) addNewWorkout;
  @override
  State<NewWorkout> createState() {
    return _NewWorkoutState();
  }
}

class _NewWorkoutState extends State<NewWorkout>{
  final _workoutName = TextEditingController();
  void validateWorkout(){
    if(_workoutName.text.trim().isEmpty){
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
    widget.addNewWorkout(Workout(workoutName: _workoutName.text, exerciseList: []));
    Navigator.pop(context);
  }
  @override
  Widget build(context){
    return Center(
        child:Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                
                child:Material(
                  color: Colors.grey,
                  child:
                TextField(
                  controller: _workoutName,
                  maxLength: 50,
                  decoration:  const InputDecoration(
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(5))
                     ),
                      label: Text("Add new workout")
                  ),
                ),
                )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: validateWorkout, style: ElevatedButton.styleFrom(backgroundColor: Colors.black),child: const Text("Save"), ),
                    ElevatedButton(onPressed: (){Navigator.pop(context);},style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text("Cancel")),
                  ],
                )
              ],
            )
        )
    );
  }
}