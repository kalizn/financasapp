import 'package:financasapp/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceInfoCards extends StatelessWidget {
  const BalanceInfoCards({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.totalMovement,
    required this.numOfMoves,
  }) : super(key: key);

  final String title, svgSrc;
  final double numOfMoves, totalMovement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: ThemeApplication.defaultPadding),
      padding: const EdgeInsets.all(ThemeApplication.defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: ThemeApplication.primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(ThemeApplication.defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              svgSrc,
              colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ThemeApplication.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$numOfMoves Moves",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(ThemeApplication.currencyFormatter.format(totalMovement))
        ],
      ),
    );
  }
}
