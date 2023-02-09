import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/address_picker/address_picker_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Geometry.dart';

class AddressItem extends StatelessWidget {
  final String name;
  final Geometry geometry;
  final Function() onTap;
  final bool isStartAddress;

  const AddressItem({
    Key? key,
    required this.name,
    required this.geometry,
    required this.onTap,
    required this.isStartAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isStartAddress) {
          BlocProvider.of<AddressPickerBloc>(context).add(PickStartAddress(name));
        } else {
          BlocProvider.of<AddressPickerBloc>(context).add(PickEndAddress(name));
        }
        onTap();
      },
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            '${geometry.coordinates[0].toString()}, ${geometry.coordinates[1].toString()}',
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
