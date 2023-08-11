import 'package:flutter/material.dart';
import '../constants.dart';


class IconContent extends StatelessWidget {
  IconContent({required this.label,required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0,color: Colors.white,),
        SizedBox(height: 20,),
        Text(label, style: klabelTextStyle),
      ],
    );
  }
}
