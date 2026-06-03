import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../services/storage_service.dart';
import '../main.dart';
import 'home_screen.dart';

class UnitSelectScreen extends StatelessWidget {
  const UnitSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                l10n.selectUnitSystem,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              _UnitCard(
                title: l10n.metric,
                subtitle: '(kg / cm)',
                icon: Icons.straighten,
                onTap: () => _selectUnit(context, 'metric'),
              ),
              const SizedBox(height: 24),
              _UnitCard(
                title: l10n.imperial,
                subtitle: '(lbs / ft + in)',
                icon: Icons.scale,
                onTap: () => _selectUnit(context, 'imperial'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectUnit(BuildContext context, String system) {
    context.read<AppState>().setUnitSystem(system);
    context.read<StorageService>().setOnboardingComplete(true);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainNavigationHolder()),
      (route) => false,
    );
  }
}

class _UnitCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _UnitCard({
    required this.title,
    required this.subtitle,
    required this.icon,
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
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Row(
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
