import 'dart:math';

class CalculateBMI {
  double calculateBMI({double? height, int? weight}) {
    final bmi = weight! / pow(height! / 100, 2);

    return bmi;
  }

  static String getResult({double? bmi}) {
    if (bmi! >= 25) {
      return 'Ашыкча салмак';
    } else if (bmi > 18.5) {
      return 'Норма erwtyjurewtyt';
    } else {
      return 'Салмак аз';
    }
  }

  static String feedBack({double? bmi}) {
    if (bmi! >= 25) {
      return 'Сиздин салмагыныз ашыкча. Кобуроок спорт менен машыгыныз!!! 🏃‍♀️🏃‍♂️🏊‍♀️🏋️‍♀️🚴‍♂️';
    } else if (bmi > 18.5) {
      return 'Сиздин салмагыныз нормада. Куттуктайбыз!!! 🎉🎉🎉👍👍👍';
    } else {
      return 'Кобуроок тамактаныныз.Салмагыныз жетишпейт!🍕🍔🍌🍎🍐';
    }
  }
}
