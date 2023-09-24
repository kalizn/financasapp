class CurrentInvoice {
  final String? icon, title, date;
  final double? value;

  CurrentInvoice({this.icon, this.title, this.date, this.value});
}

List demoCurrentInvoice = [
  CurrentInvoice(
    icon: "assets/icons/recent_bus.svg",
    title: "Bus Refund",
    date: "01-03-2021",
    value: 17.39,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_hand_money.svg",
    title: "Transfer Received",
    date: "27-02-2021",
    value: 15.8,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_market.svg",
    title: "Market Payment",
    date: "23-02-2021",
    value: -35.5,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_bus.svg",
    title: "Bus Payment",
    date: "21-02-2021",
    value: -98.0,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_hand_money.svg",
    title: "Transfer Received",
    date: "23-02-2021",
    value: 77.12,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_money_bag.svg",
    title: "Bonus Received",
    date: "25-02-2021",
    value: 63.79,
  ),
  CurrentInvoice(
    icon: "assets/icons/recent_market.svg",
    title: "Market Payment",
    date: "25-02-2021",
    value: -719.32,
  ),
];