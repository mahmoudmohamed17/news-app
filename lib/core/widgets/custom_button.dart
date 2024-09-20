import 'package:flutter/material.dart';
import 'package:news_app/core/styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Styles.textStyle32,
        ),
      ),
    );
  }
}
