import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';

class PestDiseaseScreen extends StatelessWidget {
  const PestDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pests = [
      {'name': 'Aphids', 'crop': 'Banana', 'severity': 'High', 'color': 0xFFEF5350},
      {'name': 'Leaf Blight', 'crop': 'Rice', 'severity': 'Medium', 'color': 0xFFFFA726},
      {'name': 'Root Rot', 'crop': 'Tomato', 'severity': 'Low', 'color': 0xFF66BB6A},
      {'name': 'Spider Mite', 'crop': 'Chili', 'severity': 'High', 'color': 0xFFEF5350},
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
        title: const Text('Pest & Disease',
            style: TextStyle(
                color: AppColors.textDark, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: const [
                  Icon(Icons.search, color: AppColors.textGrey, size: 20),
                  SizedBox(width: 8),
                  Text('Search pest or disease…',
                      style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...pests.map((p) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color(p['color'] as int).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.bug_report,
                        color: Color(p['color'] as int)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['name'] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15)),
                        Text('Crop: ${p['crop']}',
                            style: const TextStyle(
                                color: AppColors.textGrey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(p['color'] as int).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(p['severity'] as String,
                        style: TextStyle(
                            color: Color(p['color'] as int),
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 16),
            AgroButton(
              label: 'Scan for Disease',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}