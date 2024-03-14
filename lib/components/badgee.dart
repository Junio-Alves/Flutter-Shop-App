import 'package:flutter/material.dart';

class Badgee extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const Badgee({
    super.key,
    required this.child,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: -2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Theme.of(context).secondaryHeaderColor),
              constraints: BoxConstraints(maxHeight: 16, maxWidth: 20),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 7, color: Colors.white),
              ),
            ))
      ],
    );
  }
}
