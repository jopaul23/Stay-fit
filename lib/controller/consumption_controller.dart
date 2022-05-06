import 'package:get/get.dart';
import 'package:stayfit/models/food__model.dart';

class ConsumptionController extends GetxController {
  int requirement = 1650;
  int intake = 0;
  List<FoodModel> fruits = [
    FoodModel(
        food: "guava",
        calories: 32,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "orange",
        calories: 37,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "pear",
        calories: 37,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "mango",
        calories: 42,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "lime",
        calories: 27,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "peach",
        calories: 40,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "apple",
        calories: 62,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "banana",
        calories: 110,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "piece"),
    FoodModel(
        food: "watermelon",
        calories: 20,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "few slices"),
    FoodModel(
        food: "litches",
        calories: 53,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "few slices"),
    FoodModel(
        food: "melone",
        calories: 23,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one bowl"),
    FoodModel(
        food: "pomogranate",
        calories: 55,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one bowl"),
    FoodModel(
        food: "grapes",
        calories: 60,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one bowl"),
  ];
  List<FoodModel> breads = [
    FoodModel(
        food: "bread",
        calories: 45,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "poori",
        calories: 75,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "roti",
        calories: 100,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "parantha",
        calories: 150,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "aloo parantha",
        calories: 170,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "pav",
        calories: 180,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "naan",
        calories: 262,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "butter naan",
        calories: 310,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
  ];
  List<FoodModel> beverages = [
    FoodModel(
        food: "tea",
        calories: 45,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "black tea",
        calories: 10,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "milk",
        calories: 60,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "milk shake",
        calories: 200,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one bottle"),
    FoodModel(
        food: "tender coconut",
        calories: 30,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "beer",
        calories: 200,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one bottle"),
    FoodModel(
        food: "alcohol",
        calories: 75,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one serving"),
  ];
  List<FoodModel> indianfoods = [
    FoodModel(
        food: "pappad",
        calories: 45,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "idili",
        calories: 100,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "plain dosha",
        calories: 120,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "masala dosha",
        calories: 250,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "medium piece"),
    FoodModel(
        food: "pickels",
        calories: 30,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one spoon"),
    FoodModel(
        food: "Veg rice",
        calories: 250,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one plate"),
    FoodModel(
        food: "boiled rice",
        calories: 120,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "fried rice",
        calories: 150,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "sambar",
        calories: 150,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "curd",
        calories: 100,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
  ];
  List<FoodModel> nonveg = [
    FoodModel(
        food: "egg",
        calories: 75,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one piece"),
    FoodModel(
        food: "meat",
        calories: 450,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one plate"),
    FoodModel(
        food: "mutton biriyani",
        calories: 225,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "chicken curry",
        calories: 300,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one cup"),
    FoodModel(
        food: "fish curry",
        calories: 140,
        cunsumed: 0,
        toConsume: 0,
        pieceName: "one serving"),
  ];
}
