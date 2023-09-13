// maker_page.dart
import 'package:flutter/material.dart';
import '../../data/models/car.dart';

class MakerPage extends StatelessWidget {
  final String selectedMaker;
  final List<Car> cars;

  const MakerPage({super.key, required this.selectedMaker, required this.cars});

  @override
  Widget build(BuildContext context) {
    // Filter the cars based on the selected maker
    final List<Car> filteredCars =
        cars.where((car) => car.maker == selectedMaker).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cars by $selectedMaker'),
      ),
      body: ListView.builder(
        itemCount: filteredCars.length,
        itemBuilder: (context, index) {
          final car = filteredCars[index];
          return ListTile(
            title: Text(car.model),
            subtitle: Text(
                'Year: ${car.year}, Price: \$${car.sellingPrice.toStringAsFixed(2)}'),
            // Add more details or functionality here if needed
          );
        },
      ),
    );
  }
}
