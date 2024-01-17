import 'package:hotel_ui/features/Trip/Domain/entities/trip.dart';
import 'package:hotel_ui/features/Trip/Domain/repositories/itrip_repository.dart';

class GetTrip {
  final ITripRepository _repository;
  GetTrip(this._repository);

  Future<List<Trip>> call() async {
    return _repository.getTrip();
  }

}