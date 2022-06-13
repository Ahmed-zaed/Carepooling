import 'package:flutter/material.dart';

class LitTile extends StatelessWidget {
  const LitTile({
    Key? key,
    required this.title,
    required this.supTitle,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String supTitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Colors.white70,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: icon,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(supTitle),
      ),
    );
  }
}
