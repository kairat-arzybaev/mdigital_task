import 'package:flutter/material.dart';

import '../../data/models/car.dart';

class CarDetailCard extends StatelessWidget {
  final Car car;

  const CarDetailCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(car.model),
        subtitle: Text(
            'Year: ${car.year}, Price: \$${car.sellingPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}
