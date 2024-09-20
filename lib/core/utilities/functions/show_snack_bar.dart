import 'package:flutter/material.dart';
import 'package:news_app/core/styles/styles.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    message,
    style: Styles.textStyle20,
  )));
}
