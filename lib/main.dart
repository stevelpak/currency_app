import 'package:flutter/material.dart';
import 'package:currency/utils/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/currency_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<CurrencyModel>(CurrencyModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
    );
  }
}
