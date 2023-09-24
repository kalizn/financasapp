import 'package:flutter/material.dart';

import '../../../theme_app.dart';
import 'chart.dart';
import 'balance_info_cards.dart';

class BalanceDetails extends StatelessWidget {
  const BalanceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ThemeApplication.defaultPadding),
      decoration: const BoxDecoration(
        color: ThemeApplication.secondColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Balance Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: ThemeApplication.defaultPadding),
          Chart(),
          BalanceInfoCards(
            svgSrc: "assets/icons/movement_euro.svg",
            title: "Crypto",
            totalMovement: 1798241.00,
            numOfMoves: 1798,
          ),
          BalanceInfoCards(
            svgSrc: "assets/icons/movement_down.svg",
            title: "Falling Stocks",
            totalMovement: 34012,
            numOfMoves: 1328,
          ),
          BalanceInfoCards(
            svgSrc: "assets/icons/movement_up.svg",
            title: "Stocks on the Rise",
            totalMovement: 78541025,
            numOfMoves: 1328,
          ),
          BalanceInfoCards(
            svgSrc: "assets/icons/movement_transfer.svg",
            title: "Transfers",
            totalMovement: 160000,
            numOfMoves: 5328,
          ),
        ],
      ),
    );
  }
}