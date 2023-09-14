import '../domain/models/car.dart';
import '../domain/models/car_maker.dart';
import 'local/car_data.dart';

class CarDataService {
  List<Car> fetchCars() {
    try {
      return carsForSale.map((data) => Car.fromJson(data)).toList();
    } catch (e) {
      rethrow;
    }
  }

  List<CarMaker> fetchCarMakers() {
    try {
      return carMaker.map((data) => CarMaker.fromJson(data)).toList();
    } catch (e) {
      rethrow;
    }
  }

  List<Car> fetchCarsForMaker(CarMaker carMaker) {
    final List<Car> carsForMaker = carsForSale
        .where((carData) => carData['maker'] == carMaker.name)
        .map((carData) => Car.fromJson(carData))
        .toList();

    return carsForMaker;
  }
}
