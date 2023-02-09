import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/address_picker/AddressItem.dart';
import 'package:multimodal_routeplanner/02_application/bloc/address_picker/address_picker_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_planner/advanced_route_planner_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Geometry.dart';

class AddressPickerWidget extends StatelessWidget {
  const AddressPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visibility = false;
    bool isStartAddress = false;
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
          if (state is StartAddressRetrieved) {
            isStartAddress = true;
          }
          if (state is EndAddressRetrieved) {
            isStartAddress = false;
          }
        }
        return BlocBuilder<AdvancedRoutePlannerBloc, AdvancedRoutePlannerState>(
          builder: (context, state) {
            if (state is LoadingTrip) {
              visibility = false;
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
                              Geometry geometry = Geometry([0.0, 0.0], 'geometry');
                              if (listAddresses[index].properties.city != null &&
                                  listAddresses[index].properties.postcode != null) {
                                if (listAddresses[index].properties.name != null) {
                                  name =
                                      '${listAddresses[index].properties.name}, ${listAddresses[index].properties.postcode.toString()} ${listAddresses[index].properties.city}';
                                } else if (listAddresses[index].properties.street != null &&
                                    listAddresses[index].properties.housenumber != null) {
                                  name =
                                      '${listAddresses[index].properties.street} ${listAddresses[index].properties.housenumber.toString()}, ${listAddresses[index].properties.postcode.toString()} ${listAddresses[index].properties.city}';
                                }
                              } else {
                                name = 'kein Name gefunden';
                              }
                              geometry = listAddresses[index].geometry;

                              if (index + 1 == listAddresses.length) {
                                return AddressItem(
                                  name: name,
                                  geometry: geometry,
                                  onTap: () {
                                    visibility = false;
                                  },
                                  isStartAddress: isStartAddress,
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AddressItem(
                                        name: name,
                                        geometry: geometry,
                                        onTap: () {
                                          visibility = false;
                                        },
                                        isStartAddress: isStartAddress),
                                    const Divider()
                                  ],
                                );
                              }
                            })),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
