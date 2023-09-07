import 'package:bmi_calculator1/calculate_bmi.dart';
import 'package:bmi_calculator1/icon_with_label.dart';
import 'package:bmi_calculator1/result_screen.dart';
import 'package:bmi_calculator1/reuseable_card.dart';
import 'package:bmi_calculator1/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderSelection { Male, Female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inActiveColor = const Color(0xff1d1e33);
  final activeColor = const Color(0xff1d1e33);

  GenderSelection? selection;
  double _height = 150;
  int _weight = 65;
  int _age = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: selection == GenderSelection.Male
                        ? inActiveColor
                        : inActiveColor,
                    myChild: const IconWithLabel(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection = GenderSelection.Male;
                      });
                    },
                  ),
                  ReuseableCard(
                    color: selection == GenderSelection.Male
                        ? inActiveColor
                        : activeColor,
                    myChild: const IconWithLabel(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onpress: () {
                      setState(() {
                        selection == GenderSelection.Female;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReuseableCard(
              color: const Color(0xff1d1e33),
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Container(
                        child: Text(
                          _height.toStringAsFixed(0),
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: const Text(
                          'cm',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xffeb1555),
                        overlayColor: const Color(0x15eb1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue;
                          });
                        },
                        max: 220,
                        min: 120,
                        value: _height.toDouble(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReuseableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: const Text(
                              'WEIGHT',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Text(
                              _weight.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedBTN(
                                color: const Color(0xff0A0E21),
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundedBTN(
                                color: const Color(0xff0A0E21),
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]),
                  ),
                  ReuseableCard(
                    color: const Color(0xff1d1e33),
                    myChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: const Text(
                              'AGE',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          Container(
                            child: Text(
                              _age.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedBTN(
                                color: const Color(0xff0A0E21),
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundedBTN(
                                color: const Color(0xff0A0E21),
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                              )
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: CalculateBMI().calculateBMI(
                        height: _height,
                        weight: _weight,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'Эсепте',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(double.infinity, 80),
              ),
            )
          ],
        ),
      ),
    );
  }
}
