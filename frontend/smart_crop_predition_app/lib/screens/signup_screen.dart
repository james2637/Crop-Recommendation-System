import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Center(child: AgroLogo(size: 32)),
              const SizedBox(height: 40),
              const AgroTextField(label: 'Email Address'),
              const SizedBox(height: 16),
              AgroTextField(
                label: 'Password',
                obscure: _obscure1,
                suffix: IconButton(
                  icon: Icon(_obscure1
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () => setState(() => _obscure1 = !_obscure1),
                ),
              ),
              const SizedBox(height: 16),
              AgroTextField(
                label: 'Confirm Password',
                obscure: _obscure2,
                suffix: IconButton(
                  icon: Icon(_obscure2
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () => setState(() => _obscure2 = !_obscure2),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'It must be a combination of minimum 8 letters, numbers and symbols.',
                style: TextStyle(fontSize: 11, color: AppColors.textGrey),
              ),
              const SizedBox(height: 24),
              AgroButton(label: 'Signup', onPressed: () {}),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ',
                      style:
                      TextStyle(color: AppColors.textGrey, fontSize: 13)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Log In',
                        style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 13)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SocialLoginButton(
                  label: 'Log in with Google',
                  icon: Icons.g_mobiledata,
                  onPressed: () {}),
              const SizedBox(height: 12),
              SocialLoginButton(
                  label: 'Log in with Apple',
                  icon: Icons.apple,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}