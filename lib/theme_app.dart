import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ThemeApplication {
  static const primaryColor = Color(0xFF2697FF);
  static const secondColor = Color(0xFF2A2D3E);
  static const backgroundColor = Color(0xFF212332);
  static const defaultPadding = 16.0;

  static NumberFormat currencyFormatter = NumberFormat.currency(
  locale: 'en_US',
  symbol: '\$',
  );
}