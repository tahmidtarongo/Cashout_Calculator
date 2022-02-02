import 'package:cash_out_cal/calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.cardColor,
      required this.amount,
      required this.item,
      required this.subItem});

  final Color cardColor;
  final String amount;
  final String item;
  final String subItem;

  @override
  Widget build(BuildContext context) {
    Calculation cal = Calculation(amount: amount, item: item, subItem: subItem);
    return Scaffold(
      backgroundColor: backgroundColorOne,
      appBar: AppBar(
        backgroundColor: cardColor,
        title: const Center(
          child: Text(
            'CASHOUT CAL',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 7.0),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      cal.mainAmount(amount),
                      //textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      cal.itemCalculationCashOutCharge(),
                      // 'Cashout charge : ' +
                      //     cal.cashOutCharge(amount, item, 18.50).toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      cal.itemCalculation(),
                      // 'Total with cashout charge : ' +
                      //     cal
                      //         .totalWithCashOutCharge(amount, item, 18.5)
                      //         .toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Center(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              color: cardColor,
              width: double.infinity,
              height: 80.0,
              margin: const EdgeInsets.only(top: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
