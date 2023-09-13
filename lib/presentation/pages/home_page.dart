import 'package:flutter/material.dart';
import 'package:mdigital_task/presentation/widgets/maker_list.dart';

import '../../data/local/cars_data.dart';
import '../../data/models/car.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Car> cars = carsData.map((json) => Car.fromJson(json)).toList();
    final Map<String, int> makerCounts = {};

    for (var car in cars) {
      final String maker = car.maker;
      if (makerCounts.containsKey(maker)) {
        makerCounts[maker] = makerCounts[maker]! + 1;
      } else {
        makerCounts[maker] = 1;
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Car Makers'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: makerCounts.length,
              itemBuilder: (context, index) {
                final makerCountsList = makerCounts.entries.toList();
                return MakerList(
                  maker: makerCountsList[index].key,
                  count: makerCountsList[index].value,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MakerPage(
                    //       selectedMaker: makerCountsList[index].key,
                    //       cars: cars,
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
