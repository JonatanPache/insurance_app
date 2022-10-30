import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insurance_app/src/utils/style/colors.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: (){},
            icon:SvgPicture.asset(
              'assets/svg/calendar.svg',
              width: 20.0,
            )
        ),
        SizedBox(width: 5),
        IconButton(
            onPressed: (){},
            icon:SvgPicture.asset(
              'assets/svg/ring.svg',
              width: 20.0,
            )
        ),
        SizedBox(width: 5),
        IconButton(
            onPressed: (){},
            icon: SvgPicture.asset(
              'assets/svg/user.svg',
              width: 30.0,
            )
        ),
      ],
    );
  }
}
