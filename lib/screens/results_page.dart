import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Center(
              child: Container(
                //width: MediaQuery.of(context).size.width,
                child: Text(
                  "Your Result",
                  style: GoogleFonts.lato(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )),
            Expanded(
              flex: 4,
              child: ReuseableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        resultText,
                        style: GoogleFonts.lato(textStyle: kResultTextStyle),
                      ),
                    ),
                    Text(
                      "Your BMI score is:",
                      style:
                          GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      bmiResult,
                      style: GoogleFonts.lato(textStyle: kBMITextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 40, bottom: 40),
                      child: Text(
                        interpretation,
                        style: GoogleFonts.lato(textStyle: kBodyTextStyle),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: "Re-Calculate")
          ],
        ),
      )),
    );
  }
}
