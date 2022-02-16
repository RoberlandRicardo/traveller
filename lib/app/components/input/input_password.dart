import 'package:flutter/material.dart';
import 'package:traveller/app/styles/custom_text.dart';

class InputPassword extends StatefulWidget {
  final String label;
  final Function onChanged;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  InputPassword(
      {required this.label,
      required this.onChanged,
      this.placeholder,
      this.keyboardType,
      this.controller});

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [
          TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: _passwordVisible,
            style: CustomText.input,
            onChanged: (value) => widget.onChanged(value),
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: CustomText.label,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: widget.placeholder ?? "",
              hintStyle: TextStyle(color: Color.fromRGBO(152, 152, 152, 1)),
              filled: true,
              fillColor: Color.fromRGBO(238, 238, 238, 1),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility, //change icon based on boolean value
                  color: CustomText.fontColorOrange,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible; //change boolean value
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
