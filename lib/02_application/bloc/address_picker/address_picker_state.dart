part of 'address_picker_bloc.dart';

@immutable
abstract class AddressPickerState {}

class AddressPickerInitial extends AddressPickerState {}

class RetrievingAddress extends AddressPickerState {}

abstract class AddressRetrieved extends AddressPickerState {
  final List<Address> listAddresses;

  AddressRetrieved(this.listAddresses);
}

class StartAddressRetrieved implements AddressRetrieved {
  @override
  final List<Address> listAddresses;

  StartAddressRetrieved(this.listAddresses);
}

class EndAddressRetrieved implements AddressRetrieved {
  @override
  final List<Address> listAddresses;

  EndAddressRetrieved(this.listAddresses);
}

abstract class AddressPicked extends AddressPickerState {
  final String address;

  AddressPicked(this.address);
}

class StartAddressPicked implements AddressPicked {
  @override
  final String address;

  StartAddressPicked(this.address);
}

class EndAddressPicked implements AddressPicked {
  @override
  final String address;

  EndAddressPicked(this.address);
}

class AddressError extends AddressPickerState {}
