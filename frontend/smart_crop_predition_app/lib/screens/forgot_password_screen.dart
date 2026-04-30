import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _step = 0; // 0 = email, 1 = OTP + new password

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: AgroLogo(size: 32)),
              const SizedBox(height: 40),
              const Text('Forgot Password',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark)),
              const SizedBox(height: 8),
              const Text(
                'Enter your email to reset your password',
                style: TextStyle(color: AppColors.textGrey, fontSize: 13),
              ),
              const SizedBox(height: 32),
              if (_step == 0) ...[
                const AgroTextField(label: 'Email Address'),
                const SizedBox(height: 24),
                AgroButton(
                  label: 'Continue',
                  onPressed: () => setState(() => _step = 1),
                ),
              ] else ...[
                const AgroTextField(label: 'Email Address'),
                const SizedBox(height: 16),
                const AgroTextField(label: 'OTP'),
                const SizedBox(height: 16),
                const AgroTextField(
                    label: 'New Password', obscure: true),
                const SizedBox(height: 16),
                const AgroTextField(
                    label: 'Confirm Password', obscure: true),
                const SizedBox(height: 8),
                const Text(
                  'It must be a combination of minimum 8 letters, numbers and symbols.',
                  style:
                  TextStyle(fontSize: 11, color: AppColors.textGrey),
                ),
                const SizedBox(height: 24),
                AgroButton(
                  label: 'Change',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LoginScreen()),
                            (r) => false);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}