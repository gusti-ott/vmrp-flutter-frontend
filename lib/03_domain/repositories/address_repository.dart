import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';

abstract class AddressRepository {
  Future<List<Address>> getAddressFromApi({required String address});
}
