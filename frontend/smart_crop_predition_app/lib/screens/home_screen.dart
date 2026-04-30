import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';
import 'cost_of_cultivation_screen.dart';
import 'fertilizer_calculation_screen.dart';
import 'pest_disease_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _showSearch = false;
  final _searchCtrl = TextEditingController();
  final List<String> _recentSearches = ['Banana', 'Chili pest', 'banana'];

  final List<_InsightItem> _insights = [
    _InsightItem(
        icon: Icons.science,
        color: Color(0xFF66BB6A),
        text:
        'Fertilizer Reminder: Apply Potassium to Banana tomorrow morning for optimal yield'),
    _InsightItem(
        icon: Icons.bug_report,
        color: Color(0xFFEF5350),
        text:
        'Pest Alert: Check for aphids on your banana plants. Scan for early detection'),
    _InsightItem(
        icon: Icons.water_drop,
        color: Color(0xFF42A5F5),
        text:
        'Rain Alert: Check for aphids on your banana plants. Scan for early detection'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _currentIndex == 0
            ? _buildHome()
            : _currentIndex == 1
            ? _buildCropsTab()
            : _currentIndex == 3
            ? _buildSearchTab()
            : _buildHome(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
          _showSearch = false;
        }),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grass_outlined), label: 'Crops'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined), label: 'Fig'),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AgroLogo(size: 26),
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primaryLighter,
                child: const Text('R',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search bar
          GestureDetector(
            onTap: () => setState(() => _showSearch = true),
            child: Container(
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
                  Text('Search',
                      style: TextStyle(
                          color: AppColors.textGrey, fontSize: 14)),
                  Spacer(),
                  Icon(Icons.mic_outlined,
                      color: AppColors.textGrey, size: 20),
                ],
              ),
            ),
          ),
          if (_showSearch) ...[
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Text('Recent searches',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textGrey)),
                  ),
                  ..._recentSearches.map((s) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.history,
                        size: 16, color: AppColors.textGrey),
                    title: Text(s, style: const TextStyle(fontSize: 14)),
                    trailing: const Icon(Icons.close,
                        size: 16, color: AppColors.textGrey),
                    onTap: () {},
                  )),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          // Weather card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFA5D6A7), Color(0xFFE8F5E9)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('28°C',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w700)),
                    Text('Humidity  80%', style: TextStyle(fontSize: 13)),
                    SizedBox(height: 4),
                    Text('Cloudy', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text('Today is a good day to apply fertilizers',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.primary)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.wb_cloudy, size: 60, color: Colors.white70),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Quick action icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _QuickAction(
                icon: Icons.science,
                label: 'Fertilizer\nCalculation',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                        const FertilizerCalculationScreen())),
              ),
              _QuickAction(
                icon: Icons.attach_money,
                label: 'Cost of\nCultivation',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                        const CostOfCultivationScreen())),
              ),
              _QuickAction(
                icon: Icons.bug_report,
                label: 'Pest &\nDisease',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PestDiseaseScreen())),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Farm Insights
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My Farm Insights',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              TextButton(
                onPressed: () {},
                child: const Text('View All Tasks',
                    style: TextStyle(
                        color: AppColors.primary, fontSize: 13)),
              ),
            ],
          ),
          ..._insights.map((item) => _InsightCard(item: item)),
        ],
      ),
    );
  }

  Widget _buildCropsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.grass, size: 64, color: AppColors.primaryLight),
          const SizedBox(height: 16),
          const Text('My Crops', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return Padding(
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
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(border: InputBorder.none))),
                Icon(Icons.close, color: AppColors.textGrey, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Recent searches',
                style: TextStyle(fontSize: 13, color: AppColors.textGrey)),
          ),
          ..._recentSearches.map((s) => ListTile(
            leading: const Icon(Icons.history,
                color: AppColors.textGrey, size: 18),
            title: Text(s),
            trailing: const Icon(Icons.close, size: 16),
            onTap: () {},
          )),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primaryLighter,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style:
              const TextStyle(fontSize: 11, color: AppColors.textDark)),
        ],
      ),
    );
  }
}

class _InsightItem {
  final IconData icon;
  final Color color;
  final String text;
  const _InsightItem(
      {required this.icon, required this.color, required this.text});
}

class _InsightCard extends StatelessWidget {
  final _InsightItem item;
  const _InsightCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, color: item.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(item.text,
                style:
                const TextStyle(fontSize: 12, color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}