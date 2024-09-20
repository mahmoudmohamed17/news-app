import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/styles/styles.dart';

class CustomDataField extends StatelessWidget {
  const CustomDataField({super.key, required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: kTextFieldColor,
        borderRadius: BorderRadius.circular(45),
      ),
      height: 55,
      child: Row(
        children: [
          Text(
            '$label:',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
