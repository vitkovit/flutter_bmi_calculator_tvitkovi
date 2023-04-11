import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
// import 'main.dart';

enum Gender { male, female }

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
        primaryColor: kPrimaryColour,
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
  int height = 180; // for slider and this cant be hardcoded
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
        backgroundColor: kPrimaryColour,
        appBar: AppBar(
          backgroundColor: kPrimaryColour,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //this will stretch all fields to fit width
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(
                    () {
                      selectedGender = Gender.male;
                    },
                  );
                },
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //when container receive a child it will tyr to fit and resize the size of a child
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .baseline, //place children to baseline match, but you need to give "what" to align
                      textBaseline: TextBaseline
                          .alphabetic, //error will go away and cm will be aligned
                      children: <Widget>[
                        Text(
                          // '180',
                          height
                              .toString(), // to replace 180 with floating value

                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      // value: height, //expected value is double
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        // print(newValue); //slider will not move because does not rebuild parent widget
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                      colour: kActiveCardColour,
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
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                      colour: kActiveCardColour,
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
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}

//immutable widgets can be destroyed and new one created

//final
