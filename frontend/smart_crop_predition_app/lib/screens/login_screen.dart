import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/widgets.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

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
              AgroTextField(
                label: 'Email Address',
                controller: _emailCtrl,
              ),
              const SizedBox(height: 16),
              AgroTextField(
                label: 'Password',
                obscure: _obscure,
                controller: _passCtrl,
                suffix: IconButton(
                  icon: Icon(_obscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen())),
                  child: const Text('Forgot Password?',
                      style: TextStyle(color: AppColors.accent, fontSize: 13)),
                ),
              ),
              const SizedBox(height: 8),
              AgroButton(
                label: 'Login',
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen())),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style:
                      TextStyle(color: AppColors.textGrey, fontSize: 13)),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_) => const SignupScreen())),
                    child: const Text('Signup',
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
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              SocialLoginButton(
                label: 'Log in with Apple',
                icon: Icons.apple,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}