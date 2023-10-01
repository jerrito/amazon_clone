import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/dimens.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? obscuringCharacter;
  final bool? obscureText;
  final double? fontSize;
  final double? letterSpacing;
  final FocusNode? focusNode;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final bool? enabled;
  final Widget? label;

  const PrimaryTextFormField({
    Key? key,
    this.maxLength, this.controller, this.onChanged, this.keyboardType,
    this.hintText, this.validator, this.obscuringCharacter, this.obscureText,
    this.fontSize, this.initialValue, this.focusNode, this.letterSpacing,
    this.onEditingComplete, this.onSaved, this.onTap, this.suffix, this.enabled, this.label, this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      onTap:onTap,
      enabled: enabled,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? '•',
      style: TextStyle(fontSize: fontSize,letterSpacing: letterSpacing),
      decoration: InputDecoration(
        label: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusNormal),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusNormal),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        // icon: Icon(Icons.person)
      ),
      validator: (val){
        if(val!.isEmpty){
          return hintText==null? "Field required":"Enter your $hintText";
        }
        return null;
      },
    );
  }
}
