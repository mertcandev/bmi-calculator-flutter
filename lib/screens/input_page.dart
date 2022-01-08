import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/calculator_brain.dart';

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
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('BMI CALCULATOR',
                style: GoogleFonts.lato(
                    fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ? kActiveCardColour
                          : kInactiveCardColour,
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
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          cardIcon: Icons.female, cardText: "Female"),
                    )),
                  ],
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",
                            style:
                                GoogleFonts.lato(textStyle: kLabelTextStyle)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style:
                                  GoogleFonts.lato(textStyle: kNumberTextStyle),
                            ),
                            Text(
                              "cm",
                              style:
                                  GoogleFonts.lato(textStyle: kLabelTextStyle),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xffeb1555),
                              activeTrackColor: Colors.white,
                              trackHeight: 1,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 10),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 18),
                              overlayColor: Color(0x29eb1555)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            //activeColor: Color(0xffeb1555),
                            inactiveColor: Color(0xff8d8e98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: ReuseableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: GoogleFonts.lato(textStyle: kLabelTextStyle),
                          ),
                          Text(
                            weight.toString(),
                            style:
                                GoogleFonts.lato(textStyle: kNumberTextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Icons.add,
                              ),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: Icons.remove,
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: ReuseableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: GoogleFonts.lato(textStyle: kLabelTextStyle),
                          ),
                          Text(
                            age.toString(),
                            style:
                                GoogleFonts.lato(textStyle: kNumberTextStyle),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                ),
                BottomButton(
                  buttonTitle: "Calculate",
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                )
              ],
            ),
          )),
    );
  }
}
