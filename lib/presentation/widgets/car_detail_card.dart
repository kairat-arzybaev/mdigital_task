import 'package:flutter/material.dart';

class CarDetailCard extends StatelessWidget {
  const CarDetailCard({
    Key? key,
    required this.model,
    required this.year,
    required this.price,
  }) : super(key: key);

  final String model;
  final int year;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 178, 132, 209),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Year: $year',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Price: $price',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
