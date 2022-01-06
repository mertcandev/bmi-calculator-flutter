import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const Color activeCardColour = Color(0xff1d1e33);
const Color inactiveCardColour = Color(0xff111328);
const Color bottomContainerColor = Color(0xffeb1555);
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

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
                      child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild:
                        IconContent(cardIcon: Icons.male, cardText: "Male"),
                  )),
                  Expanded(
                      child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild:
                        IconContent(cardIcon: Icons.female, cardText: "Female"),
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
