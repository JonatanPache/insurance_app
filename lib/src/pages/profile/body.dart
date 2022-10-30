import 'package:flutter/material.dart';
import 'package:insurance_app/src/pages/profile/profile_menu.dart';
import 'package:insurance_app/src/pages/profile/profile_pic.dart';
import 'package:insurance_app/src/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(children: [
          ProfilePic(),
          SizedBox(height: 30),
          ProfileMenu(
            icon: "assets/img/create_cliente.png",
            text: "Mi cuenta",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/img/create_cliente.png",
            text: "Notificaciones",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/img/create_cliente.png",
            text: "Settings",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/img/create_cliente.png",
            text: "Help Center",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/img/create_cliente.png",
            text: "Cerrar Session",
            press: () => logout(),
          ),
        ]),
      ),
    );
  }

  Future<void> logout() async {
    final form = _formKey.currentState;
    if (!form.validate()) return;
    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    await provider.logout();
    Navigator.pop(context,'login');
  }
}
