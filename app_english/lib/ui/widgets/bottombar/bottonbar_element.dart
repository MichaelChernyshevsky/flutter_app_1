import 'package:flutter/material.dart';

class ElementBottombar extends StatelessWidget {
  const ElementBottombar({
    super.key,
    required this.itRoute,
    required this.title,
    required this.tab,
    required this.icon,
    required this.color,
  });

  final String? itRoute;
  final String title;
  final VoidCallback tab;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: tab,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: 85,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: icon,
          ),
        ),
      ),
    );
  }
}
