import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multimodal_routeplanner/01_presentation/route_planner/widgets/search_page/mode_input/RouteButton.dart';
import 'package:multimodal_routeplanner/02_application/bloc/address_picker/address_picker_bloc.dart';
import 'package:multimodal_routeplanner/02_application/bloc/route_planner/advanced_route_planner_bloc.dart';
import 'package:multimodal_routeplanner/03_domain/entities/MobilityMode.dart';
import 'package:multimodal_routeplanner/03_domain/enums/MobilityModeEnum.dart';

class AdvancedSearchInput extends StatelessWidget {
  const AdvancedSearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: remove this when online
    String startAddress = "";
    String endAddress = "";

    TextEditingController startTextController = TextEditingController();
    TextEditingController endTextController = TextEditingController();
    List<TextEditingController> textEditingControllers = [startTextController, endTextController];

    return BlocBuilder<AddressPickerBloc, AddressPickerState>(
      builder: (context, state) {
        if (state is StartAddressPicked) {
          startAddress = state.address;
          //TODO: this needs to be set some other way, because it overrides the other controller
          textEditingControllers[0].text = startAddress;
        } else if (state is EndAddressPicked) {
          endAddress = state.address;
          textEditingControllers[1].text = endAddress;
        }
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: TextFormField(
              controller: textEditingControllers[0],
              onChanged: ((value) {
                startAddress = value.toString();
                BlocProvider.of<AddressPickerBloc>(context).add(StartAddressInputChanged(startAddress));
              }),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Startadresse in München",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: TextFormField(
              controller: textEditingControllers[1],
              onChanged: ((value) {
                endAddress = value.toString();
                BlocProvider.of<AddressPickerBloc>(context).add(EndAddressInputChanged(endAddress));
              }),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Zieladresse in München",
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          AdvancedRouteButtonWidget(
            loadFirstTrip: () {
              BlocProvider.of<AdvancedRoutePlannerBloc>(context).add(
                  RouteFirstTripEvent(startAddress, endAddress, MobilityMode(mode: MobilityModeEnum.bike)));
            },
          ),
        ]);
      },
    );
  }
}
