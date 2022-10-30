import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insurance_app/src/utils/config/responsive.dart';
import 'package:insurance_app/src/utils/config/size_config.dart';
import 'package:insurance_app/src/utils/style/colors.dart';
import 'package:insurance_app/src/utils/style/style.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;
  const InfoCard({
    Key key,
    this.icon,
    this.label,
    this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minWidth: 35),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amberAccent
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon,width: 55,height: 55),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          PrimaryText(
            text: label,
            size: 14,
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
