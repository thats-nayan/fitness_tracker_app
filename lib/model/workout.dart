import 'package:fitness_tracker/model/exercise.dart';

class Workout{
  Workout({required this.workoutName,required this.exerciseList}): id = uuid.v4();
  final String id;
  final String workoutName;
  final List <Exercise> exerciseList;
}