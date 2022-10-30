import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insurance_app/src/providers/AuthProvider.dart';
import 'package:insurance_app/src/utils/config/size_config.dart';
import 'package:insurance_app/src/utils/style/colors.dart';

class SideMenu extends StatelessWidget{
  const SideMenu({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        color: AppColors.secondaryBg,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 35,
                    height: 20,
                    child: SvgPicture.asset(
                        'assets/svg/mac-action.svg'
                    ),
                  )
              ),
              //home user
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              // home client
              if(AuthProvider().isAuthenticated) IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/clipboard.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              // sign out
              IconButton(
                onPressed: ()=>
                Navigator.popAndPushNamed(context, 'login'),
                icon: SvgPicture.asset(
                  'assets/svg/sign-out.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}