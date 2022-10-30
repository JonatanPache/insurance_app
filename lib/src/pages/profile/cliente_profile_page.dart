import 'package:flutter/material.dart';
import 'package:insurance_app/src/pages/enums.dart';
import 'package:insurance_app/src/pages/profile/body.dart';
import 'package:insurance_app/src/utils/component/custom_bottom_nav_bar.dart';

class ClienteProfilePage extends StatefulWidget {
  const ClienteProfilePage({Key key}) : super(key: key);

  @override
  State<ClienteProfilePage> createState() => _ClienteProfilePageState();
}
class _ClienteProfilePageState extends State<ClienteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
        ),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(
            selectMenu: MenuState.profile
        )
    );
  }
}