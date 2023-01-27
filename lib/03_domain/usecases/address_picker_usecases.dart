import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';
import 'package:multimodal_routeplanner/03_domain/repositories/address_repository.dart';
import 'package:multimodal_routeplanner/04_infrastructure/repositories/address_repository_impl.dart';

class AddressPickerUsecases {
  final AddressRepository addressRepository = AddressRepositoryImpl();

  Future<List<Address>> getAddress({required String inputAddress}) async {
    return addressRepository.getAddressFromApi(address: inputAddress);
  }
}
