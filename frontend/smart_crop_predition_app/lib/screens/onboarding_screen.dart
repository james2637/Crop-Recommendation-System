import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardData> _pages = [
    _OnboardData(
      icon: Icons.grass,
      iconBg: Color(0xFFB9F6CA),
      title: 'Crop Care',
      subtitle: 'Crop Production',
    ),
    _OnboardData(
      icon: Icons.bug_report,
      iconBg: Color(0xFFC8E6C9),
      title: 'Crop Growth',
      subtitle: 'Pest and disease control',
    ),
    _OnboardData(
      icon: Icons.smart_toy,
      iconBg: Color(0xFFDCEDC8),
      title: 'AI Plants Care',
      subtitle: 'AI Pest and disease control',
    ),
  ];

  void _next() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    } else {
      _goLogin();
    }
  }

  void _back() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  void _goLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFF5FBF5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const AgroLogo(size: 28),
              const SizedBox(height: 32),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemCount: _pages.length,
                  itemBuilder: (_, i) => _OnboardPage(data: _pages[i]),
                ),
              ),
              _DotsIndicator(count: _pages.length, current: _currentPage),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage > 0)
                      TextButton(
                          onPressed: _back,
                          child: const Text('Back',
                              style: TextStyle(color: AppColors.textGrey)))
                    else
                      TextButton(
                          onPressed: _goLogin,
                          child: const Text('Skip',
                              style: TextStyle(color: AppColors.textGrey))),
                    GestureDetector(
                      onTap: _next,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _currentPage == _pages.length - 1
                              ? Icons.check
                              : Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardData {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  const _OnboardData(
      {required this.icon,
        required this.iconBg,
        required this.title,
        required this.subtitle});
}

class _OnboardPage extends StatelessWidget {
  final _OnboardData data;
  const _OnboardPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: data.iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(data.icon, size: 80, color: AppColors.primary),
          ),
          const SizedBox(height: 32),
          Text(data.title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark)),
          const SizedBox(height: 8),
          Text(data.subtitle,
              style: const TextStyle(
                  fontSize: 15, color: AppColors.textGrey),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int current;
  const _DotsIndicator({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: i == current ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: i == current ? AppColors.primary : AppColors.primaryLight,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}