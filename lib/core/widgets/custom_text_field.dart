import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/styles/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    this.onFieldSubmitted,
  });
  final String hintText;
  final IconData? icon;
  final TextInputType textInputType;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required.';
        }
      },
      style: Styles.textStyle20,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: (widget.hintText != 'Password') ? false : obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        
        fillColor: kTextFieldColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: Styles.textStyle18,
        suffixIcon: (widget.hintText == 'Password')
            ? (obscureText == true)
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            obscureText = false;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility_off,
                          size: 32,
                          color: Colors.black,
                        )),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            obscureText = true;
                          });
                        },
                        icon: const Icon(
                          Icons.visibility,
                          size: 32,
                          color: Colors.black,
                        )),
                  )
            : Padding(
                padding: const EdgeInsets.only(right: 27),
                child: Icon(
                  widget.icon,
                  size: 32,
                  color: Colors.black,
                ),
              ),
        contentPadding: const EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          // borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          // borderSide: const BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          // borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
