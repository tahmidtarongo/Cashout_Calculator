class Calculation {
  Calculation(
      {required this.amount, required this.item, required this.subItem});
  final String amount;
  final String item;
  final String subItem;
  final double bkashCashOutCharge = 18.5;
  final double nogodCashOutCharge = 11.52;
  final double rocketCashOutCharge = 18;

  String mainAmount(String money) {
    double mainAmount = double.parse(money);
    return 'Main amount : ' + mainAmount.toStringAsFixed(2);
  }

  double onlyCashoutCharge(String money, String items, double cashoutCost) {
    double mainAmount = double.parse(money);
    double withdrawnCast = (mainAmount / 1000) * cashoutCost;
    return withdrawnCast;
  }

  double howCanYouWithdraw(String money, double cashoutCost) {
    int i = 0;
    double howCanCashout = 0;
    List<double> p = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ];
    double t1;
    double t2;
    double t3;

    p[i] = double.parse(money);

    while (p[i] > 0.01) {
      t1 = p[i] - (p[i] / 1000) * cashoutCost;
      howCanCashout = howCanCashout + t1;
      t2 = t1 + (t1 / 1000) * cashoutCost;
      t3 = p[i] - t2;

      i++;
      p[i] = t3;
    }
    return howCanCashout;
  }

  double totalAmountWithCashoutCharge(
      String money, String items, double cashoutCost) {
    double mainAmount = double.parse(money);
    double withdrawnCast = (mainAmount / 1000) * cashoutCost;
    return mainAmount + withdrawnCast;
  }

  String itemCalculationCashOutCharge() {
    if (item == 'Items.bkash') {
      if (subItem == 'SubItems.howCanWithdraw') {
        String t = howCanYouWithdraw(amount, bkashCashOutCharge).toString();
        return 'Cashout charge : ' +
            onlyCashoutCharge(t, item, bkashCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Cashout charge : ' +
            onlyCashoutCharge(amount, item, bkashCashOutCharge)
                .toStringAsFixed(2);
      }
    } else if (item == 'Items.nogod') {
      if (subItem == 'SubItems.howCanWithdraw') {
        String t = howCanYouWithdraw(amount, nogodCashOutCharge).toString();
        return 'Cashout charge : ' +
            onlyCashoutCharge(t, item, nogodCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Cashout charge : ' +
            onlyCashoutCharge(amount, item, nogodCashOutCharge)
                .toStringAsFixed(2);
      }
    } else if (item == 'Items.rocket') {
      if (subItem == 'SubItems.howCanWithdraw') {
        String t = howCanYouWithdraw(amount, rocketCashOutCharge).toString();
        return 'Cashout charge : ' +
            onlyCashoutCharge(t, item, rocketCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Cashout charge : ' +
            onlyCashoutCharge(amount, item, rocketCashOutCharge)
                .toStringAsFixed(2);
      }
    }
    return 'no';
  }

  String itemCalculation() {
    if (item == 'Items.bkash') {
      if (subItem == 'SubItems.howCanWithdraw') {
        return 'You can cashout : ' +
            howCanYouWithdraw(amount, bkashCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Total with cashout charge : ' +
            totalAmountWithCashoutCharge(amount, item, bkashCashOutCharge)
                .toStringAsFixed(2);
      }
    } else if (item == 'Items.nogod') {
      if (subItem == 'SubItems.howCanWithdraw') {
        return 'You can cashout : ' +
            howCanYouWithdraw(amount, nogodCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Total with cashout charge : ' +
            totalAmountWithCashoutCharge(amount, item, nogodCashOutCharge)
                .toStringAsFixed(2);
      }
    } else if (item == 'Items.rocket') {
      if (subItem == 'SubItems.howCanWithdraw') {
        return 'You can cashout : ' +
            howCanYouWithdraw(amount, rocketCashOutCharge).toStringAsFixed(2);
      } else {
        return 'Total with cashout charge : ' +
            totalAmountWithCashoutCharge(amount, item, rocketCashOutCharge)
                .toStringAsFixed(2);
      }
    }
    return 'no';
  }
}
