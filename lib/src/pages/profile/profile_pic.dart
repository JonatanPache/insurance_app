import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget{
  const ProfilePic({
    Key key,
  }): super(key:key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 145,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundColor:Colors.white,
            backgroundImage: AssetImage("assets/svg/user.svg"),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child:SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white)
                ),
                color: Colors.white70,
                onPressed: (){},
                child: SvgPicture.asset("assets/svg/electricity.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}