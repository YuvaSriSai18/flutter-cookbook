import 'package:currency_converter/pages/currency_material_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* 
  Types of widgets
  1. Stateless
  2. Stateful
  3. Inherited
*/

/*
Design Systems
1. Material Design - By Google
2. Cupertino Design - By Apple
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CurrencyConverterHomePage());
  }
}
