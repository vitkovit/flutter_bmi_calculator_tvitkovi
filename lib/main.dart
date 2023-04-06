import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

// import 'imput_page.dart';
const bottomContainerHeight = 70.0;
// if you put 70, it will interpret it as integer, put 70.0 and it becomes float
Color activeCardColour = Color(0xff1D1E33);
Color bottomContainerColor = Color(0xFFEB1555);
Color inactiveCardColour = Color(0xFF111328);
Color primaryColour = Color(0xFF0A0E21);

enum Gender {
  male,
  female
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // testing theme https://docs.flutter.dev/cookbook/design/themes
      //copyWith will allow to rewrite
      theme: ThemeData.dark().copyWith(
        //TODO: app bar does not change color
        // specific color are represented as ARGB Transparent RGB
        primaryColor: primaryColour,
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male; //it needs to have assigned initial value

  // get rid of this function using ternary
  // Color maleCardColor = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;
  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColour) {
  //       maleCardColor = activeCardColour;
  //       femaleCardColor = inactiveCardColour;
  //     } else {
  //       maleCardColor = inactiveCardColour;
  //     }
  //   }
  //   if (selectedGender == Gender.female){
  //     if (femaleCardColor == inactiveCardColour) {
  //       femaleCardColor = activeCardColour;
  //       maleCardColor = inactiveCardColour;
  //
  //     } else {
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColour,
        appBar: AppBar(
          backgroundColor: primaryColour,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      // a lot of possible detections, check doc
                      onTap: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                            // updateColor(Gender.male);
                          },
                        );
                      },
                      child: Reusable_card(
                        colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,

                          cardChild: IconContent(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                              () {
                                selectedGender = Gender.female;
                            // updateColor(Gender.female);
                          },
                        );
                      },
                      child: Reusable_card(
                        colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                        cardChild: IconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Reusable_card(
                colour: activeCardColour,
                cardChild: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Reusable_card(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Reusable_card(
                      colour: activeCardColour,
                      cardChild: Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}

//immutable widgets can be destroyed and new one created

//final

