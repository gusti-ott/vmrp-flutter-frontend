import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';

abstract class PhotonAddressDatasource {
  Future<List<Address>> getListAddressesFromApi({required String inputAddress});
}

class PhotonAddressDatasourceImpl implements PhotonAddressDatasource {
  final http.Client client = http.Client();

  @override
  Future<List<Address>> getListAddressesFromApi({required String inputAddress}) async {
    var url = 'https://photon.komoot.io/api/?q=$inputAddress';

    final response = await client.get(Uri.parse(url));
    final responseBody = json.decode(response.body)['features'];

    final List<Address> listAddresses = [];
    responseBody.forEach((element) {
      Address address = Address.fromJson(element);
      listAddresses.add(address);
    });

    return listAddresses;
  }
}
