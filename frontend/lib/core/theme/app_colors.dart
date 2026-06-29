import 'package:flutter/material.dart';

class AppColors {
  // Primary brand — deep navy
  static const Color primary = Color(0xFF0A1628);
  static const Color primaryVariant = Color(0xFF122040);

  // Accent — electric blue
  static const Color accent = Color(0xFF2563EB);
  static const Color accentLight = Color(0xFF3B82F6);
  static const Color accentGlow = Color(0xFF60A5FA);

  // Success — emerald
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);

  // Warning — amber
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);

  // Danger — rose
  static const Color danger = Color(0xFFEF4444);
  static const Color dangerLight = Color(0xFFF87171);

  // Surfaces
  static const Color surface = Color(0xFF0F1E36);
  static const Color surfaceCard = Color(0xFF162032);
  static const Color surfaceElevated = Color(0xFF1C2B45);
  static const Color surfaceBorder = Color(0xFF1E3A5F);

  // Text
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF4B5E7A);
  static const Color textInverse = Color(0xFF0A1628);

  // Category colors
  static const Color catFood = Color(0xFFF97316);
  static const Color catTransport = Color(0xFF6366F1);
  static const Color catShopping = Color(0xFFEC4899);
  static const Color catHealth = Color(0xFF14B8A6);
  static const Color catEntertainment = Color(0xFFA855F7);
  static const Color catSalary = Color(0xFF10B981);
  static const Color catOther = Color(0xFF64748B);

  // Gradient stops
  static const List<Color> primaryGradient = [
    Color(0xFF0A1628),
    Color(0xFF122040),
  ];
  static const List<Color> accentGradient = [
    Color(0xFF2563EB),
    Color(0xFF7C3AED),
  ];
  static const List<Color> goldGradient = [
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
  ];
}
