import 'package:flutter/material.dart';
import 'package:news_app/core/styles/styles.dart';

class NewsErrorWidget extends StatelessWidget {
  const NewsErrorWidget({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
        style: Styles.textStyle32,
      ),
    );
  }
}