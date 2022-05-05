import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(
          title: "Today's food consumption",
          shadow: true,
        ),
        backgroundColor: white,
        body: Container(
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
                    percent: caloriesConsumed / toConsumed,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$caloriesConsumed of $toConsumed",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dosa",
                        style: TextStyle(
                            color: primaryPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "2.0 medium",
                        style: TextStyle(color: primaryPurple, fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                    width: 110,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (itemCount > 0) itemCount--;
                                });
                              },
                              child: _decrementer()),
                          Text(
                            "$itemCount",
                            style: TextStyle(
                                color: primaryPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  itemCount++;
                                });
                              },
                              child: _incrementer()),
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _incrementer() {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: primaryPurple),
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
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: primaryPurple),
    alignment: Alignment.center,
    child: Icon(
      Icons.remove,
      color: white,
      size: 25,
    ),
  );
}
