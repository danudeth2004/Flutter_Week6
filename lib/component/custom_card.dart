import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isCircle;
  const CustomCard({super.key, required this.text, required this.backgroundColor, this.isCircle = false });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor, 
        borderRadius:
          isCircle ? BorderRadius.circular(0) :
          BorderRadius.circular(20)
      ),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}