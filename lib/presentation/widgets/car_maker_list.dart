import 'package:flutter/material.dart';

class CarMakerList extends StatelessWidget {
  const CarMakerList({
    Key? key,
    required this.maker,
    required this.count,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  final String maker;
  final int count;
  final String imagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.amberAccent,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        maker,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        '$count cars',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_outlined),
      onTap: onTap,
    );
  }
}
