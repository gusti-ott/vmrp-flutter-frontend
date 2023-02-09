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

          List<Address> listAddresses =
              await addressPickerUsecases.getAddress(inputAddress: event.addressInput);

          listAddresses.removeWhere((element) =>
              element.properties.city != 'München' && element.properties.country != 'Deutschland');

          if (event is StartAddressInputChanged) {
            emit(StartAddressRetrieved(listAddresses));
          } else if (event is EndAddressInputChanged) {
            emit(EndAddressRetrieved(listAddresses));
          }
        }

        if (event is PickAddress) {
          if (event is PickStartAddress) {
            emit(StartAddressPicked(event.address));
          } else if (event is PickEndAddress) {
            emit(EndAddressPicked(event.address));
          }
        }
      },
      transformer: restartable(),
    );
  }
}
