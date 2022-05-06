import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stayfit/controller/consumption_controller.dart';
import 'package:stayfit/models/food__model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/wigdets/appbar.dart';

class FoodConsumptionPage extends StatefulWidget {
  const FoodConsumptionPage({Key? key}) : super(key: key);

  @override
  State<FoodConsumptionPage> createState() => _FoodConsumptionPageState();
}

class _FoodConsumptionPageState extends State<FoodConsumptionPage> {
  int caloriesConsumed = 20;
  int itemCount = 0;
  int toConsumed = 1200;
  final consumtionControler = Get.find<ConsumptionController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(
          title: "Today's food consumption",
          shadow: true,
        ),
        backgroundColor: white,
        body: GetBuilder<ConsumptionController>(builder: (context) {
          return Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      progressColor: Colors.green,
                      radius: 35,
                      lineWidth: 8,
                      percent: (consumtionControler.intake /
                                  consumtionControler.requirement) >
                              1
                          ? 1
                          : (consumtionControler.intake /
                              consumtionControler.requirement),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${consumtionControler.intake} of ${consumtionControler.requirement}",
                          style: TextStyle(
                            color: primaryPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "calori Eaten",
                          style: TextStyle(
                            color: primaryPurple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Foods Eaten",
                    style: TextStyle(
                      color: primaryPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Indian Foods",
                            style: TextStyle(
                              color: primaryPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (FoodModel foodModel
                            in consumtionControler.indianfoods)
                          Padding(
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodModel.food,
                                      style: TextStyle(
                                          color: primaryPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${foodModel.pieceName} (${foodModel.calories})",
                                      style: TextStyle(
                                          color: primaryPurple, fontSize: 16),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 110,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (foodModel.cunsumed > 0)
                                                  foodModel.cunsumed--;
                                                consumtionControler.intake -=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _decrementer()),
                                        Text(
                                          foodModel.cunsumed.toString(),
                                          // "$itemCount",
                                          // "",
                                          style: TextStyle(
                                              color: primaryPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                foodModel.cunsumed++;

                                                consumtionControler.intake +=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _incrementer()),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Beverages",
                            style: TextStyle(
                              color: primaryPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (FoodModel foodModel
                            in consumtionControler.beverages)
                          Padding(
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodModel.food,
                                      style: TextStyle(
                                          color: primaryPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${foodModel.pieceName} (${foodModel.calories})",
                                      style: TextStyle(
                                          color: primaryPurple, fontSize: 16),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 110,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (foodModel.cunsumed > 0)
                                                  foodModel.cunsumed--;
                                                consumtionControler.intake -=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _decrementer()),
                                        Text(
                                          foodModel.cunsumed.toString(),
                                          // "$itemCount",
                                          // "",
                                          style: TextStyle(
                                              color: primaryPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                foodModel.cunsumed++;
                                                consumtionControler.intake +=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _incrementer()),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Fruits",
                            style: TextStyle(
                              color: primaryPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (FoodModel foodModel in consumtionControler.fruits)
                          Padding(
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodModel.food,
                                      style: TextStyle(
                                          color: primaryPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${foodModel.pieceName} (${foodModel.calories})",
                                      style: TextStyle(
                                          color: primaryPurple, fontSize: 16),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 110,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (foodModel.cunsumed > 0)
                                                  foodModel.cunsumed--;
                                                consumtionControler.intake -=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _decrementer()),
                                        Text(
                                          foodModel.cunsumed.toString(),
                                          // "$itemCount",
                                          // "",
                                          style: TextStyle(
                                              color: primaryPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                foodModel.cunsumed++;
                                                consumtionControler.intake +=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _incrementer()),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Breads",
                            style: TextStyle(
                              color: primaryPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (FoodModel foodModel in consumtionControler.breads)
                          Padding(
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodModel.food,
                                      style: TextStyle(
                                          color: primaryPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "${foodModel.pieceName} (${foodModel.calories})",
                                      style: TextStyle(
                                          color: primaryPurple, fontSize: 16),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 110,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (foodModel.cunsumed > 0)
                                                  foodModel.cunsumed--;
                                                consumtionControler.intake -=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _decrementer()),
                                        Text(
                                          foodModel.cunsumed.toString(),
                                          // "$itemCount",
                                          // "",
                                          style: TextStyle(
                                              color: primaryPurple,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                foodModel.cunsumed++;
                                                consumtionControler.intake +=
                                                    foodModel.calories;
                                                consumtionControler.update();
                                              });
                                            },
                                            child: _incrementer()),
                                      ]),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

Widget _incrementer() {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: Colors.green),
    alignment: Alignment.center,
    child: Icon(
      Icons.add,
      color: white,
      size: 25,
    ),
  );
}

Widget _decrementer() {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: Colors.red),
    alignment: Alignment.center,
    child: Icon(
      Icons.remove,
      color: white,
      size: 25,
    ),
  );
}
