import 'package:flutter/material.dart';
import 'package:currency/compare_page.dart';
import 'package:currency/currency_page.dart';

class Routes {
  static const comparePage = '/';
  static const currencyPage = '/currencyPage';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case comparePage:
          return MaterialPageRoute(builder: (context) => const ComparePage());
        case currencyPage:
          return MaterialPageRoute(builder: (context) => const CurrencyPage());
        default:
          return MaterialPageRoute(builder: (context) => const ComparePage());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const ComparePage());
    }
  }
}
