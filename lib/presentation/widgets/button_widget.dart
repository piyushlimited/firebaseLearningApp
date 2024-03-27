import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget elevatedButton(
      {required BuildContext context,
      required Function() onPressed,
      required dynamic child,
      Alignment alignment = Alignment.center}) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              alignment: alignment,
              minimumSize: Size(MediaQuery.of(context).size.width / 1, 45),
              maximumSize: Size(MediaQuery.of(context).size.width / 1, 45)),
          onPressed: () => onPressed(),
          child: child),
    );
  }
}
