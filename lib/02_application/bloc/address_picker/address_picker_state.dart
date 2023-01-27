part of 'address_picker_bloc.dart';

@immutable
abstract class AddressPickerState {}

class AddressPickerInitial extends AddressPickerState {}

class RetrievingAddress extends AddressPickerState {}

class AddressRetrieved extends AddressPickerState {
  final List<Address> listAddresses;

  AddressRetrieved(this.listAddresses);
}

class AddressError extends AddressPickerState {}
