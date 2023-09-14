import "package:uuid/uuid.dart";
const uuid = Uuid();
class Exercise {
  Exercise({required this.exerciseName,required this.sets,required this.reps,
    required this.weights}) : id = uuid.v4();
  final String id;
  final String exerciseName;
  final int sets;
  final int reps;
  final double weights;
}