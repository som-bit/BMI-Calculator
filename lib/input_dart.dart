import 'package:bmi_calculator/reUsable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'resultScreen.dart';
import 'calculator_brain.dart';

//enum delegation
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
  int age = 19;
  // Color maleCardColor = Color(inActiveColor);
  // Color femaleCardColor = Color(inActiveColor);
  //
  // //Using enums declared above
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == Color(inActiveColor)) {
  //       maleCardColor = Color(color);
  //       femaleCardColor = Color(inActiveColor);
  //     } else {
  //       maleCardColor = Color(inActiveColor);
  //     }
  //   } else {
  //     if (femaleCardColor == Color(inActiveColor)) {
  //       femaleCardColor = Color(color);
  //       maleCardColor = Color(inActiveColor);
  //     } else {
  //       femaleCardColor = Color(inActiveColor);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //That contains our expanded widgets vertically
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                //when male is clicked
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    //Using ternary operators to select color
                    color: selectedGender == Gender.male
                        ? Color(kActiveColor)
                        : Color(kInActiveColor),
                    usableCardChild: myIcon(
                      iconData: FontAwesomeIcons.mars,
                      lable: 'MALE',
                    ),
                  ),
                ),
                //When female is clicked
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    //using ternary operators to select color
                    color: selectedGender == Gender.female
                        ? Color(kActiveColor)
                        : Color(kInActiveColor),
                    usableCardChild: myIcon(
                      iconData: FontAwesomeIcons.venus,
                      lable: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Slide Widget Design
          Expanded(
            child: ReusableCard(
              color: Color(kActiveColor),
              usableCardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'HEIGHT',
                      style: kLableStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLableStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(newValue);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              //weight card
              Expanded(
                child: ReusableCard(
                  color: Color(kActiveColor),
                  usableCardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLableStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: Color(kActiveColor),
                  usableCardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kLableStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Calculator_Brain cal =
                  new Calculator_Brain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Resultpage(
                  Result: cal.CalculateBMI(),
                  resultText: cal.getResults(),
                  interpretation: cal.getInterpretation(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CalCulate',
                  style: kBigButtonStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              height: kBottomContinerHeight,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
