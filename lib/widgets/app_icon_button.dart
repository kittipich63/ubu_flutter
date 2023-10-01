import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const AppIconButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(360),
      splashColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.grey.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: icon,
      ),
    );
  }
}