import 'package:flutter/material.dart';
import 'app_colors.dart';

class AgroLogo extends StatelessWidget {
  final double size;
  const AgroLogo({super.key, this.size = 28});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.eco, color: AppColors.primary, size: size),
        const SizedBox(width: 6),
        Text(
          'AGRO',
          style: TextStyle(
            fontSize: size * 0.85,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

class AgroButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool outlined;
  final double? width;

  const AgroButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outlined = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: outlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label,
            style: const TextStyle(color: AppColors.textDark)),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16)),
      ),
    );
  }
}

class AgroTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final TextEditingController? controller;
  final Widget? suffix;

  const AgroTextField({
    super.key,
    required this.label,
    this.obscure = false,
    this.controller,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBg,
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: AppColors.textDark,
        ),
      ),
    );
  }
}