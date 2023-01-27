part of 'address_picker_bloc.dart';

@immutable
abstract class AddressPickerEvent {}

class AddressInputChanged extends AddressPickerEvent {
  final String addressInput;

  AddressInputChanged(this.addressInput);
}
