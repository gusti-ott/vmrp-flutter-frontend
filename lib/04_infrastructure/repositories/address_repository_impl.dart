import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';
import 'package:multimodal_routeplanner/03_domain/repositories/address_repository.dart';
import 'package:multimodal_routeplanner/04_infrastructure/datasources/photon_address_datasource.dart';

class AddressRepositoryImpl implements AddressRepository {
  final PhotonAddressDatasource photonAddressDatasource = PhotonAddressDatasourceImpl();

  @override
  Future<List<Address>> getAddressFromApi({required String address}) async {
    final remoteListAddresses = await photonAddressDatasource.getListAddressesFromApi(inputAddress: address);
    return remoteListAddresses;
  }
}
