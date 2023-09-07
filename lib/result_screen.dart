import 'package:bmi_calculator1/calculate_bmi.dart';
import 'package:bmi_calculator1/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double? bmiResult;

  const ResultScreen({
    super.key,
    this.bmiResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                child: const Text(
                  'Жыйынтык',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ReuseableCard(
              color: const Color(0xff1d1e33),
              myChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        CalculateBMI.getResult(bmi: bmiResult),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.green),
                      ),
                    ),
                    Text(
                      bmiResult!.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 60),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        CalculateBMI.feedBack(bmi: bmiResult),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ]),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Кайра эсепте'.toLowerCase()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size(double.infinity, 80),
              ),
            )
          ]),
    );
  }
}
