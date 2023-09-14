import 'package:flutter/material.dart';
import 'package:mdigital_task/data/car_data_service.dart';
import 'package:mdigital_task/presentation/widgets/car_maker_list.dart';

import '../../domain/models/car_maker.dart';
import 'car_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CarMaker> carMakers = [];
  Map<String, int> carMap = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    final makers = CarDataService().fetchCarMakers();
    final cars = CarDataService().fetchCars();
    final carCountMap = <String, int>{};
    for (final carMaker in makers) {
      final count = cars.where((car) => car.maker == carMaker.name).length;
      carCountMap[carMaker.name] = count;
    }
    setState(() {
      carMakers = makers;
      carMap = carCountMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Car Makers'),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.displaySmall,
          toolbarHeight: 100,
        ),
        body: Center(
          child: carMakers.isEmpty
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: carMakers.length,
                    itemBuilder: (context, index) {
                      final carMaker = carMakers[index];
                      return CarMakerList(
                        maker: carMaker.name,
                        count: carMap[carMaker.name]!,
                        imagePath: carMaker.logo,
                        onTap: () {
                          final cars =
                              CarDataService().fetchCarsForMaker(carMaker);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarListPage(
                                carMaker: carMaker,
                                carsForMaker: cars,
                              ),
                            ),
                          );
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
