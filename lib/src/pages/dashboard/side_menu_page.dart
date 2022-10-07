import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 35,
                    height: 20,
                    child: SvgPicture.asset(
                        'assets/svg/mac-action.svg'
                    ),
                  )
              ),
              //home
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              //sign in
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/invoice.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              //cotizar
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/bank.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              //contacto
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: EdgeInsets.symmetric(vertical: 20.0),
              ),
              // pagar factura
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  'assets/svg/credit-card.svg',
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