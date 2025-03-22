import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female, None }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.None;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                        child: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                        colour: selectedGender == Gender.male
                            ? Color(0xFF1D1E33)
                            : Color(0xFF111328),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ReusableCard(
                        child: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: selectedGender == Gender.female
                            ? Color(0xFF1D1E33)
                            : Color(0xFF111328),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbColor: Colors.blue.shade200,
                                overlayColor:
                                    Colors.blue.shade200.withAlpha(0x29),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 30)),
                            child: Slider(
                                value: height.toDouble(),
                                min: 130,
                                max: 220,
                                onChanged: (double newheight) {
                                  setState(() {
                                    height = newheight.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CustomButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CustomButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      BMIcalculation: cal.calculateBMI(),
                      result: cal.getResult(),
                      interpretation: cal.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.all(10.0),
              ),
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, this.iconData});
  final VoidCallback? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPressed,
      fillColor: Colors.blueGrey,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
    );
  }
}
