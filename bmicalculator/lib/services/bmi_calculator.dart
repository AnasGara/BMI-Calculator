import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmicalculator/generated/app_localizations.dart';
enum BMICategory { underweight, normal, overweight, obese }

class BMICalculator {
  static double calculateBMI({required double weightKg, required double heightCm}) {
    if (heightCm <= 0) return 0;
    return weightKg / pow(heightCm / 100, 2);
  }

  static BMICategory getCategory(double bmi) {
    if (bmi < 18.5) return BMICategory.underweight;
    if (bmi < 25) return BMICategory.normal;
    if (bmi < 30) return BMICategory.overweight;
    return BMICategory.obese;
  }

  static Color getCategoryColor(BMICategory category) {
    switch (category) {
      case BMICategory.underweight: return Colors.blue;
      case BMICategory.normal: return Colors.green;
      case BMICategory.overweight: return Colors.orange;
      case BMICategory.obese: return Colors.red;
    }
  }

  static String getCategoryName(BuildContext context, BMICategory category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case BMICategory.underweight: return l10n.underweight;
      case BMICategory.normal: return l10n.normal;
      case BMICategory.overweight: return l10n.overweight;
      case BMICategory.obese: return l10n.obese;
    }
  }

  static String getHealthTip(BuildContext context, BMICategory category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case BMICategory.underweight: return "Health Tip Underweight";
      case BMICategory.normal: return "Health Tip Normal";
      case BMICategory.overweight: return "Health Tip Overweight";
      case BMICategory.obese: return "Health Tip Obese";
    }
  }

  static double lbsToKg(double lbs) => lbs * 0.453592;
  static double kgToLbs(double kg) => kg / 0.453592;
  static double ftInToCm(int ft, int inches) => (ft * 30.48) + (inches * 2.54);
  static Map<String, int> cmToFtIn(double cm) {
    double totalInches = cm / 2.54;
    int ft = (totalInches / 12).floor();
    int inches = (totalInches % 12).round();
    if (inches == 12) {
      ft++;
      inches = 0;
    }
    return {'ft': ft, 'in': inches};
  }
}
