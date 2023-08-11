import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPress});
  final void Function()? onPress;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
      onPressed: onPress,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

