import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const Color activeCardColour = Color(0xff1d1e33);
const Color inactiveCardColour = Color(0xff111328);
const Color bottomContainerColor = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReuseableCard(
                      colour: maleCardColour,
                      cardChild:
                          IconContent(cardIcon: Icons.male, cardText: "Male"),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReuseableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                          cardIcon: Icons.female, cardText: "Female"),
                    ),
                  )),
                ],
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: activeCardColour,
                  borderRadius: BorderRadius.circular(15),
                ),
              )),
              Row(
                children: [
                  Expanded(child: ReuseableCard(colour: activeCardColour)),
                  Expanded(child: ReuseableCard(colour: activeCardColour)),
                ],
              ),
              Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
              )
            ],
          ),
        ));
  }
}
