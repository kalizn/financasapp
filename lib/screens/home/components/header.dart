import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../controllers/MenuAppController.dart';
import '../../../responsive.dart';
import '../../../theme_app.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Balance",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: ThemeApplication.defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeApplication.defaultPadding,
        vertical: ThemeApplication.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: ThemeApplication.secondColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeApplication.defaultPadding / 2),
              child: Text("Rachel Sunrise"),
            ),
          PopupMenuButton(
            offset: const Offset(0, ThemeApplication.defaultPadding * 2.5),
            padding: const EdgeInsets.symmetric(
                horizontal: ThemeApplication.defaultPadding / 2),
            color: ThemeApplication.secondColor,
            itemBuilder: (BuildContext context) {
              return [
                for (final item in [
                  PopupMenuItemTile(
                    title: 'My Profile',
                    svgSrc: "assets/icons/menu_profile.svg",
                    press: () {},
                  ),
                  PopupMenuItemTile(
                    title: 'My Bank',
                    svgSrc: "assets/icons/menu_bank.svg",
                    press: () {},
                  ),
                  PopupMenuItemTile(
                    title: 'Logout',
                    svgSrc: "assets/icons/menu_logout.svg",
                    press: () {},
                  ),
                ])
                  PopupMenuItem(
                    onTap: item.press,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          item.svgSrc,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 16,
                        ),
                        const SizedBox(
                            width: ThemeApplication.defaultPadding - 4),
                        Text(item.title),
                      ],
                    ),
                  ),
              ];
            },
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool open = true;
  var value = 3098.15;

  @override
  Widget build(BuildContext context) {
    String iconName =
        open ? "assets/icons/eye_opened.svg" : "assets/icons/eye_closed.svg";

    return TextField(
      readOnly: true,
      mouseCursor: SystemMouseCursors.basic,
      decoration: InputDecoration(
        hintText: open
            ? ThemeApplication.currencyFormatter.format(value)
            : '*' * ThemeApplication.currencyFormatter.format(value).length,
        fillColor: ThemeApplication.secondColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              open = !open;
            });
          },
          child: Container(
            padding:
                const EdgeInsets.all(ThemeApplication.defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(
                horizontal: ThemeApplication.defaultPadding / 2),
            decoration: const BoxDecoration(
              color: ThemeApplication.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(iconName),
          ),
        ),
      ),
    );
  }
}

class PopupMenuItemTile extends StatelessWidget {
  final String title, svgSrc;
  final VoidCallback press;

  const PopupMenuItemTile(
      {Key? key,
      required this.title,
      required this.svgSrc,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      onTap: press,
      child: Row(
        children: [
          SvgPicture.asset(
            svgSrc,
            colorFilter:
                const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
            height: 16,
          ),
          const SizedBox(
            width: ThemeApplication.defaultPadding - 4,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}