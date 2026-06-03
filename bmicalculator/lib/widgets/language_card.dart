import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String languageName;
  final String flag;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.languageName,
    required this.flag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(flag, style: const TextStyle(fontSize: 48)),
              const SizedBox(height: 16),
              Text(
                languageName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
