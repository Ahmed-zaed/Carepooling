import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({Key? key, required this.color, required this.count,
    required this.textcolor,
    required this.genderName})
      : super(key: key);
  final Color color;
  final int count;
  final Color textcolor;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          width: 50,
          height: 21,
          child:  Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              genderName,
              style: TextStyle(
                fontSize: 14,
                color: textcolor,
              ),
            ),
          ),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(2),
            color: color,
          ),
        )
      ],
    );
  }
}