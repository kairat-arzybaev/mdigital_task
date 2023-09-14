import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mdigital_task/presentation/widgets/car_detail_card.dart';
import '../../domain/models/car.dart';
import '../../domain/models/car_maker.dart';

enum SortOption {
  modelAscending,
  modelDescending,
  priceAscending,
  priceDescending,
  yearAscending,
  yearDescending,
}

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
  int pageSize = 10;
  List<Car> displayedCars = [];

  SortOption selectedSortOption = SortOption.modelAscending;
  final ScrollController _listScrollController = ScrollController();
  final ScrollController _gridScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadMore();
    _listScrollController.addListener(() {
      if (_listScrollController.position.pixels ==
          _listScrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    _gridScrollController.addListener(() {
      if (_gridScrollController.position.pixels ==
          _gridScrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  void sortCars() {
    setState(() {
      switch (selectedSortOption) {
        case SortOption.modelAscending:
          widget.carsForMaker.sort((a, b) => a.model.compareTo(b.model));
          break;
        case SortOption.modelDescending:
          widget.carsForMaker.sort((a, b) => b.model.compareTo(a.model));
          break;
        case SortOption.priceAscending:
          widget.carsForMaker
              .sort((a, b) => a.sellingPrice.compareTo(b.sellingPrice));
          break;
        case SortOption.priceDescending:
          widget.carsForMaker
              .sort((a, b) => b.sellingPrice.compareTo(a.sellingPrice));
          break;
        case SortOption.yearAscending:
          widget.carsForMaker.sort((a, b) => a.year.compareTo(b.year));
          break;
        case SortOption.yearDescending:
          widget.carsForMaker.sort((a, b) => b.year.compareTo(a.year));
          break;
      }
    });
  }

  void loadMore() {
    final startIndex = currentPage * pageSize;
    final endIndex = startIndex + pageSize;

    if (startIndex < widget.carsForMaker.length) {
      setState(() {
        displayedCars.addAll(
          widget.carsForMaker
              .skip(startIndex)
              .take(endIndex - startIndex)
              .toList(),
        );
        currentPage++;
      });
    }
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
          PopupMenuButton<SortOption>(
            iconSize: 35,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOption.modelAscending,
                child: Text('Sort by Model (Ascending)'),
              ),
              const PopupMenuItem(
                value: SortOption.modelDescending,
                child: Text('Sort by Model (Descending)'),
              ),
              const PopupMenuItem(
                value: SortOption.priceAscending,
                child: Text('Sort by Price (Ascending)'),
              ),
              const PopupMenuItem(
                value: SortOption.priceDescending,
                child: Text('Sort by Price (Descending)'),
              ),
              const PopupMenuItem(
                value: SortOption.yearAscending,
                child: Text('Sort by Year (Ascending)'),
              ),
              const PopupMenuItem(
                value: SortOption.yearDescending,
                child: Text('Sort by Year (Descending)'),
              ),
            ],
            onSelected: (option) {
              setState(() {
                selectedSortOption = option;
                sortCars();
              });
            },
          ),
        ],
      ),
      body: _buildCarList(),
    );
  }

  Widget _buildCarList() {
    if (displayedCars.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: !isGridView
          ? ListView.builder(
              controller: _listScrollController,
              itemCount: displayedCars.length,
              itemBuilder: (context, index) {
                final car = displayedCars[index];
                return CarDetailCard(
                  model: car.model,
                  year: car.year,
                  price: car.sellingPrice,
                );
              },
            )
          : GridView.builder(
              controller: _gridScrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: displayedCars.length,
              itemBuilder: (context, index) {
                final car = displayedCars[index];
                return CarDetailCard(
                  model: car.model,
                  year: car.year,
                  price: car.sellingPrice,
                );
              },
            ),
    );
  }
}
