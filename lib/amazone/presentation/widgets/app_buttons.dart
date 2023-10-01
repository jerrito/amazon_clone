import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/dimens.dart';

import '../../../constants/global_variables.dart';

class DefaultPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final Widget child;

  const DefaultPrimaryButton({
    super.key,
    this.onPressed,
    required this.child,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: GlobalVariables.selectedNavBarColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadiusNormal),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Dimens.defaultContentPadding,
            horizontal: Dimens.defaultContentPadding,
          ),
        ),
        onLongPress: onLongPress,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Color? foregroundColor;

  const PrimaryOutlinedButton(
      {super.key, this.onPressed, required this.child, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: GlobalVariables.colorPrimary,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.borderRadiusNormal),
            ),
            padding: EdgeInsets.symmetric(
              vertical: Dimens.defaultContentPadding,
              horizontal: Dimens.defaultContentPadding,
            ),
            foregroundColor: foregroundColor),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class IconLabelButton extends StatelessWidget {
  final Color backgroundColor;
  final Color? foregroundColor;
  final Color color;
  final Widget icon;
  final String label;
  final void Function()? onPressed;
  const IconLabelButton(
      {super.key,
        required this.backgroundColor,
        this.foregroundColor,
        required this.onPressed,
        required this.color,
        required this.icon,
        required this.label});
  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          //padding: EdgeInsets.symmetric(vertical:0,horizontal:5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                  width: 1,
                  color: backgroundColor,
                  style: BorderStyle.solid))),
      icon: icon,
      label: Text(label,
          style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
