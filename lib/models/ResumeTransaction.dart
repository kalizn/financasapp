import 'package:flutter/material.dart';

import '../theme_app.dart';

class CloudTransactionInfo {
  final String? svgSrc, title;
  final int? numOfOperations;
  final double? percentage, totalMovement;
  final Color? color;

  CloudTransactionInfo({
    this.svgSrc,
    this.title,
    this.totalMovement,
    this.numOfOperations,
    this.percentage,
    this.color,
  });
}

List resumeMyTransaction = [
  CloudTransactionInfo(
    title: "Crypto",
    numOfOperations: 1798,
    svgSrc: "assets/icons/movement_euro.svg",
    totalMovement: 1798241.00,
    color: ThemeApplication.primaryColor,
    percentage: 35,
  ),
  CloudTransactionInfo(
    title: "Falling Stocks",
    numOfOperations: 1328,
    svgSrc: "assets/icons/movement_down.svg",
    totalMovement: 34012,
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudTransactionInfo(
    title: "Stocks on the Rise",
    numOfOperations: 1328,
    svgSrc: "assets/icons/movement_up.svg",
    totalMovement: 78541025,
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudTransactionInfo(
    title: "Transfers",
    numOfOperations: 5328,
    svgSrc: "assets/icons/movement_transfer.svg",
    totalMovement: 160000,
    color: const Color(0xFF007EE5),
    percentage: 78,
  ),
];