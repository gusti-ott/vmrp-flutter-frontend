part of 'address_picker_bloc.dart';

@immutable
abstract class AddressPickerEvent {}

abstract class AddressInputChanged extends AddressPickerEvent {
  final String addressInput;

  AddressInputChanged(this.addressInput);
}

class StartAddressInputChanged implements AddressInputChanged {
  @override
  final String addressInput;

  StartAddressInputChanged(this.addressInput);
}

class EndAddressInputChanged implements AddressInputChanged {
  @override
  final String addressInput;

  EndAddressInputChanged(this.addressInput);
}

abstract class PickAddress extends AddressPickerEvent {
  final String address;

  PickAddress(this.address);
}

class PickStartAddress implements PickAddress {
  @override
  final String address;

  PickStartAddress(this.address);
}

class PickEndAddress implements PickAddress {
  @override
  final String address;

  PickEndAddress(this.address);
}
