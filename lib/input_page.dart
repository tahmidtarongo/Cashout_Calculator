import 'package:cash_out_cal/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constant.dart';
import 'reusable_card.dart';
import 'result_page.dart';

enum Items { bkash, nogod, rocket, other }
enum SubItems { howCanWithdraw, checkWithdrawCharge, other }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color cardColor = inactiveCardColor;
  Color subCardColor = inactiveCardColor;
  Items selectedItem = Items.other;
  SubItems selectedSubItems = SubItems.other;
  String moneyAmount = '';

  void appBurColor() {
    if (selectedItem == Items.bkash) {
      cardColor = bkashColor;
    } else if (selectedItem == Items.nogod) {
      cardColor = nogodColor;
    } else if (selectedItem == Items.rocket) {
      cardColor = rocketColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorOne,
      appBar: AppBar(
        title: const Center(
          child: Text('CASHOUT CAL'),
        ),
        backgroundColor: cardColor,
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = Items.bkash;
                        appBurColor();
                      });
                    },
                    child: ReusableCard(
                      cardText: "Bkash",
                      cardColor: selectedItem == Items.bkash
                          ? bkashColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = Items.nogod;
                        appBurColor();
                      });
                    },
                    child: ReusableCard(
                      cardText: 'Nogod',
                      cardColor: selectedItem == Items.nogod
                          ? nogodColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = Items.rocket;
                        appBurColor();
                      });
                    },
                    child: ReusableCard(
                      cardText: 'Rocket',
                      cardColor: selectedItem == Items.rocket
                          ? rocketColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (selectedItem != Items.other) {
                        setState(() {
                          selectedSubItems = SubItems.howCanWithdraw;
                        });
                      }
                    },
                    child: ReusableCard(
                      cardText: 'How can you withdraw',
                      cardColor: selectedSubItems == SubItems.howCanWithdraw &&
                              selectedItem != Items.other
                          ? cardColor
                          : inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (selectedItem != Items.other) {
                        setState(() {
                          selectedSubItems = SubItems.checkWithdrawCharge;
                        });
                      }
                    },
                    child: ReusableCard(
                      cardText: 'Check withdraw charge',
                      cardColor:
                          selectedSubItems == SubItems.checkWithdrawCharge &&
                                  selectedItem != Items.other
                              ? cardColor
                              : inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) => moneyAmount = value,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: cardColor,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: cardColor,
                    width: 3.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: cardColor,
                    width: 3.0,
                  ),
                ),
                labelText: "Please enter amount",
                labelStyle: TextStyle(
                  color: cardColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedItem != Items.other &&
                  selectedSubItems != SubItems.other &&
                  moneyAmount.isEmpty == false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        cardColor: cardColor,
                        amount: moneyAmount,
                        item: selectedItem.toString(),
                        subItem: selectedSubItems.toString(),
                      );
                    },
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                    //title: Text('AlertDialog Title'),
                    content: Text(
                      'Please select all options',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              }
            },
            child: Container(
              child: const Center(
                child: Text(
                  'Calculate',
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
