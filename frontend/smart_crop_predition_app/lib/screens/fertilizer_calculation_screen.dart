import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';

class FertilizerCalculationScreen extends StatefulWidget {
  const FertilizerCalculationScreen({super.key});

  @override
  State<FertilizerCalculationScreen> createState() =>
      _FertilizerCalculationScreenState();
}

class _FertilizerCalculationScreenState
    extends State<FertilizerCalculationScreen> {
  int _selectedType = 0;
  final List<Map<String, dynamic>> _types = [
    {'icon': Icons.water_drop, 'label': 'Liquid'},
    {'icon': Icons.science, 'label': 'Granular'},
    {'icon': Icons.local_gas_station, 'label': 'Spray'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryLighter,
            child: const Text('R',
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: AgroLogo(size: 28)),
            const SizedBox(height: 24),
            const Text('Fertilizer Calculation',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark)),
            const SizedBox(height: 24),
            // Type selector
            Row(
              children: _types.asMap().entries.map((e) {
                final selected = _selectedType == e.key;
                return GestureDetector(
                  onTap: () => setState(() => _selectedType = e.key),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primaryLighter
                          : AppColors.inputBg,
                      borderRadius: BorderRadius.circular(16),
                      border: selected
                          ? Border.all(color: AppColors.primary, width: 2)
                          : null,
                    ),
                    child: Icon(e.value['icon'] as IconData,
                        color: selected
                            ? AppColors.primary
                            : AppColors.textGrey,
                        size: 28),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            const AgroTextField(label: 'Tank Volume (L)'),
            const SizedBox(height: 16),
            const AgroTextField(label: 'Pump Injection (L/h)'),
            const SizedBox(height: 16),
            const AgroTextField(label: 'Area'),
            const SizedBox(height: 28),
            Align(
              alignment: Alignment.centerRight,
              child: AgroButton(
                label: 'Next',
                width: 120,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}