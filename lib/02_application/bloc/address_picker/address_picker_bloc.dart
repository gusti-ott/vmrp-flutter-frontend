import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:meta/meta.dart';
import 'package:multimodal_routeplanner/03_domain/entities/AddressPicker/Address.dart';
import 'package:multimodal_routeplanner/03_domain/usecases/address_picker_usecases.dart';

part 'address_picker_event.dart';

part 'address_picker_state.dart';

class AddressPickerBloc extends Bloc<AddressPickerEvent, AddressPickerState> {
  AddressPickerBloc() : super(AddressPickerInitial()) {
    AddressPickerUsecases addressPickerUsecases = AddressPickerUsecases();

    on<AddressPickerEvent>(
      (event, emit) async {
        if (event is AddressInputChanged) {
          emit(RetrievingAddress());

          List<Address> addressList =
              await addressPickerUsecases.getAddress(inputAddress: event.addressInput);
          emit(AddressRetrieved(addressList));
        }
      },
      transformer: restartable(),
    );
  }
}
