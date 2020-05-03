import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final bool enabled;
  final IconData icon;
  final Widget prefix;
  final double boxWidth, boxHeight;
  final String hintText, labelText, initialValue;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode, nextFocusNode;
  final VoidCallback submitAction;
  final Widget suffixIcon;
  final Color iconColor;
  final bool obscureText;
  final TextStyle textStyle;
  final FormFieldValidator<String> validateFunction;
  final void Function(String) onSaved, onChange;
  final Key key;

  InputBox({
    this.key,
    this.prefix,
    this.boxHeight,
    this.boxWidth,
    this.controller,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.obscureText = false,
    this.textInputType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.suffixIcon,
    this.icon,
    this.iconColor,
    this.textStyle,
    this.validateFunction,
    this.onChange,
    this.onSaved,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: boxWidth,
      height: boxHeight,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: TextFormField(
          enabled: enabled,
          onChanged: onChange,
          style: TextStyle(
            fontSize: 16,
//            color: Theme.of(context).accentColor,
          ),
          key: key,
          initialValue: initialValue,
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          validator: validateFunction,
          onSaved: onSaved,
          cursorColor: Colors.grey,
          textInputAction: textInputAction,
          focusNode: focusNode,
          onFieldSubmitted: (String term) {
            if (nextFocusNode != null) {
              focusNode.unfocus();
              FocusScope.of(context).requestFocus(nextFocusNode);
            } else {
              submitAction();
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: hintText,
            labelStyle: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
        ),
      ),
    );
  }
}
