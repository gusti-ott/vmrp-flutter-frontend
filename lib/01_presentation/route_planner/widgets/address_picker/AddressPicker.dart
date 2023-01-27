import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/address_picker/address_picker_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Geometry.dart';

class AddressPickerWidget extends StatelessWidget {
  const AddressPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visibility = false;
    List<Address> listAddresses = [];

    return BlocBuilder<AddressPickerBloc, AddressPickerState>(
      builder: (context, state) {
        if (state is AddressRetrieved) {
          visibility = true;
          listAddresses = state.listAddresses;
          if (listAddresses.length >= 5) {
            listAddresses.removeRange(5, listAddresses.length);
          }
          if (listAddresses.isEmpty) {
            visibility = false;
          }
        }
        return Visibility(
          visible: visibility,
          child: Align(
            alignment: Alignment.topLeft,
            child: Card(
              child: SizedBox(
                width: 300,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listAddresses.length,
                        itemBuilder: (BuildContext context, int index) {
                          String name = "";
                          Geometry geometry = Geometry([0.0, 0.0], 'name');
                          if (listAddresses[index].properties.name != null) {
                            name = listAddresses[index].properties.name!;
                          } else if (listAddresses[index].properties.street != null &&
                              listAddresses[index].properties.housenumber != null) {
                            name =
                                '${listAddresses[index].properties.street!} ${listAddresses[index].properties.housenumber!}';
                          } else {
                            name = 'kein Name gefunden';
                          }

                          geometry = listAddresses[index].geometry;

                          return InkWell(
                            child: Column(
                              children: [
                                Text(name),
                                Text(geometry.coordinates[0].toString()),
                                Text(geometry.coordinates[1].toString())
                              ],
                            ),
                          );
                        })),
              ),
            ),
          ),
        );
      },
    );
  }
}
