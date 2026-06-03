import 'package:flutter_test/flutter_test.dart';
import 'package:bmicalculator/services/bmi_calculator.dart';

void main() {
  group('BMICalculator Tests', () {
    test('BMI Calculation Metric', () {
      double bmi = BMICalculator.calculateBMI(weightKg: 70, heightCm: 175);
      expect(bmi.toStringAsFixed(1), '22.9');
    });

    test('BMI Category Underweight', () {
      expect(BMICalculator.getCategory(18.4), BMICategory.underweight);
    });

    test('BMI Category Normal', () {
      expect(BMICalculator.getCategory(22.0), BMICategory.normal);
    });

    test('BMI Category Overweight', () {
      expect(BMICalculator.getCategory(27.0), BMICategory.overweight);
    });

    test('BMI Category Obese', () {
      expect(BMICalculator.getCategory(31.0), BMICategory.obese);
    });

    test('Unit Conversion Lbs to Kg', () {
      expect(BMICalculator.lbsToKg(154.324).toStringAsFixed(1), '70.0');
    });

    test('Unit Conversion Ft/In to Cm', () {
      expect(BMICalculator.ftInToCm(5, 9).toStringAsFixed(1), '175.3');
    });
  });
}
