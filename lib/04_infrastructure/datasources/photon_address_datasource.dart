import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';

abstract class PhotonAddressDatasource {
  Future<List<Address>> getListAddressesFromApi({required String inputAddress});
}

class PhotonAddressDatasourceImpl implements PhotonAddressDatasource {
  final http.Client client = http.Client();

  //add coordinates of Munich, to prioritize locations in Munich (Marienplatz) (in request url)
  final String munichLat = 48.1371695.toString();
  final String munichLon = 11.571096.toString();

  @override
  Future<List<Address>> getListAddressesFromApi({required String inputAddress}) async {
    var url = 'https://photon.komoot.io/api/?q=$inputAddress&lang=de&lat=$munichLat&lon=$munichLon';

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
