import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';

class CostOfCultivationScreen extends StatelessWidget {
  const CostOfCultivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fields = [
      'Land preparation cost',
      'Seed Cost',
      'Manure Cost',
      'Labor Cost',
      'Other Cost',
      'Total Cost',
      'Yield in KG',
      'Price per KG',
      'Total Revenue',
      'ProFit',
    ];

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
            const Text('Cost of Cultivation',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark)),
            const SizedBox(height: 24),
            ...fields.asMap().entries.map((e) {
              final isProfit = e.key == fields.length - 1;
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.value,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: isProfit
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: AppColors.textDark)),
                    Container(
                      width: 140,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isProfit
                            ? AppColors.primaryLighter
                            : AppColors.inputBg,
                        borderRadius: BorderRadius.circular(8),
                        border: isProfit
                            ? Border.all(color: AppColors.primaryLight)
                            : null,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            AgroButton(label: 'Calculate', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}