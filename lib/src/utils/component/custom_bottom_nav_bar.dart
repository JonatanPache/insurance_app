import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insurance_app/src/pages/enums.dart';
import 'package:insurance_app/src/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectMenu,
  }) : super(key: key);

  final MenuState selectMenu;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15))
          ]),
      child: SafeArea(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'dashboard'),
              icon: SvgPicture.asset(
                "assets/svg/home.svg",
                color: MenuState.dashboard == selectMenu
                    ? Colors.deepOrangeAccent
                    : inActiveIconColor,
              )),
          if (authProvider.isAuthenticated)
            IconButton(
                onPressed: () => Navigator.pushNamed(context, 'servicios'),
                icon: SvgPicture.asset(
                  "assets/svg/invoice.svg",
                  color: MenuState.servicios == selectMenu
                      ? Colors.deepOrangeAccent
                      : inActiveIconColor,
                )),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'seguros'),
              icon: SvgPicture.asset(
                "assets/svg/clipboard.svg",
                color: MenuState.seguros == selectMenu
                    ? Colors.deepOrangeAccent
                    : inActiveIconColor,
              )),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, 'profile'),
              icon: SvgPicture.asset(
                "assets/svg/user.svg",
                color: MenuState.profile == selectMenu
                    ? Colors.deepOrangeAccent
                    : inActiveIconColor,
              ))
        ]),
      ),
    );
  }
}
