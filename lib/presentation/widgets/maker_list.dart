// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MakerList extends StatelessWidget {
  const MakerList({
    Key? key,
    required this.maker,
    required this.count,
    required this.onTap,
  }) : super(key: key);

  final String maker;
  final int count;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.lightGreenAccent,
      title: Row(
        children: [Text(maker), Text(' - ($count)')],
      ),
      trailing: const Icon(Icons.arrow_forward_outlined),
      onTap: onTap,
    );
  }
}
