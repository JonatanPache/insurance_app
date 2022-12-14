import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget{
  const ProfileMenu({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }):super(key:key);

  final String text,icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ElevatedButton(
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );

  }
}