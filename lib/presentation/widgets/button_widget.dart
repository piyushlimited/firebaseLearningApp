import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget elevatedButton(
      {required BuildContext context,
      required Function() onPressed,
      required dynamic child,
      Alignment alignment = Alignment.center,
      double widthScale = 1.0}) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: alignment,
            minimumSize:
                Size(MediaQuery.of(context).size.width / widthScale, 48),
          ),
          onPressed: () => onPressed(),
          child: child),
    );
  }
}
