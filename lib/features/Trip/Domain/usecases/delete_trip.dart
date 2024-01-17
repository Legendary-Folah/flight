import 'package:hotel_ui/features/Trip/Domain/repositories/itrip_repository.dart';

class DeleteTrip {

  final ITripRepository _repository;
  DeleteTrip(this._repository);

  Future<void> call(int index) async {
    return _repository.deleteTrip(index);
  }

}