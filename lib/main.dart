import 'package:cash_out_cal/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CashOutCal());
}

class CashOutCal extends StatelessWidget {
  const CashOutCal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputPage(),
    );
  }
}
