import 'package:flutter/material.dart';
import 'package:mdigital_task/presentation/widgets/car_detail_card.dart';
import '../../domain/models/car.dart';
import '../../domain/models/car_maker.dart';

class CarListPage extends StatefulWidget {
  final CarMaker carMaker;
  final List<Car> carsForMaker;

  const CarListPage(
      {super.key, required this.carMaker, required this.carsForMaker});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  bool isGridView = false;
  int currentPage = 0;
  int itemsPerPage = 10;
  int totalPages = 0;

  @override
  void initState() {
    totalPages = (widget.carsForMaker.length / itemsPerPage).ceil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars by ${widget.carMaker.name}'),
        actions: [
          IconButton(
            iconSize: 35,
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (currentPage > 0) {
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                ),
                Text(
                  'Page ${currentPage + 1} of $totalPages',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (currentPage < totalPages - 1) {
                      setState(() {
                        currentPage++;
                      });
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: widget.carsForMaker.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : isGridView
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: itemsPerPage,
                          itemBuilder: (context, index) {
                            final carIndex = currentPage * itemsPerPage + index;
                            if (carIndex < widget.carsForMaker.length) {
                              final car = widget.carsForMaker[carIndex];
                              return CarDetailCard(
                                model: car.model,
                                year: car.year,
                                price: car.sellingPrice,
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      : ListView.builder(
                          itemCount: itemsPerPage,
                          itemBuilder: (context, index) {
                            final carIndex = currentPage * itemsPerPage + index;
                            if (carIndex < widget.carsForMaker.length) {
                              final car = widget.carsForMaker[carIndex];
                              return CarDetailCard(
                                model: car.model,
                                year: car.year,
                                price: car.sellingPrice,
                              );
                            }
                            return const SizedBox();
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
