import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insurance_app/src/utils/config/responsive.dart';
import 'package:insurance_app/src/utils/style/colors.dart';
import 'package:insurance_app/src/utils/style/style.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: 'SeguroMotors',
                size: 30,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: 'Contigo... Donde estes',
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              )
            ],
          ),
        ),
        Spacer(flex: 1),

      ],
    );
  }
}
