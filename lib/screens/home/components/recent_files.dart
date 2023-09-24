import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/CurrentInvoice.dart';
import '../../../responsive.dart';
import '../../../theme_app.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
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
        children: [
          Text(
            "Current Invoice",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: ThemeApplication.defaultPadding,
              // minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("Invoice Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Value"),
                ),
              ],
              rows: List.generate(
                demoCurrentInvoice.length,
                (index) => recentFileDataRow(demoCurrentInvoice[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(CurrentInvoice fileInfo, context) {
  Color valueColor =
      fileInfo.value! < 0 ? Colors.redAccent : Colors.greenAccent;
  String minMax = fileInfo.value! < 0 ? '-' : '+';
  double value = fileInfo.value!.abs();

  double iconSize = 30, fontSizeMobile = 12;

  if (Responsive.isMobile(context)){
    iconSize = 30- 5;
    fontSizeMobile = fontSizeMobile-4;
  }
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: iconSize,
              width: iconSize,
              colorFilter:
              const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ThemeApplication.defaultPadding),
              child: Text(fileInfo.title!, style: TextStyle(fontSize: fontSizeMobile),),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!,style: TextStyle(fontSize: fontSizeMobile),)),
      DataCell(
        Text('$minMax ${ThemeApplication.currencyFormatter.format(value)}',
          style: TextStyle(color: valueColor, fontSize: fontSizeMobile),
        ),
      ),
    ],
  );
}
