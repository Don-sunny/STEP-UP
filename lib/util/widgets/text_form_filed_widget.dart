import 'package:flutter/material.dart';

class TextFormFiledWidget extends StatelessWidget {
  TextFormFiledWidget({
    super.key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.hintText,
    required this.fieldName,
  });

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final _formkey = GlobalKey<State>();
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
