import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../03_domain/enums/MobilityModeEnum.dart';

class StringMappingHelper {
  MobilityModeEnum mapModeStringToMode(String mode) {
    switch (mode) {
      case 'WALK':
        return MobilityModeEnum.walk;

      case 'CAR':
        return MobilityModeEnum.car;

      case 'BICYCLE':
        return MobilityModeEnum.bike;

      case 'MOPED':
        return MobilityModeEnum.moped;

      case 'ECAR':
        return MobilityModeEnum.ecar;

      case 'EBICYCLE':
        return MobilityModeEnum.ebike;

      case 'EMOPED':
        return MobilityModeEnum.emoped;

      case 'CAB':
        return MobilityModeEnum.cab;

      case 'EMMY':
        return MobilityModeEnum.emmy;

      case 'TIER':
        return MobilityModeEnum.tier;

      case 'FLINKSTER':
        return MobilityModeEnum.flinkster;

      case 'SHARENOW':
        return MobilityModeEnum.sharenow;

      case 'PT':
        return MobilityModeEnum.mvg;

      case 'INTERMODAL_PT_BIKE':
        return MobilityModeEnum.intermodal;

      default:
        return MobilityModeEnum.bike;
    }
  }

  mapModeStringToIcon(String mode) {
    switch (mode) {
      case 'WALK':
        return const Icon(Icons.directions_walk);

      case 'CAR':
        return const Icon(Icons.directions_car);

      case 'BICYCLE':
        return const Icon(Icons.directions_bike);

      case 'MOPED':
        return const Icon(Icons.moped);

      case 'ECAR':
        return const Icon(
          Icons.electric_car,
        );

      case 'EBICYCLE':
        return const Icon(
          Icons.electric_bike,
        );

      case 'EMOPED':
        return const Icon(
          Icons.electric_moped,
        );

      case 'CAB':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_cab.png'),
        );

      case 'EMMY':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_emmy.png'),
        );

      case 'TIER':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_tier.jpg'),
        );

      case 'FLINKSTER':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_flinkster.png'),
        );

      case 'SHARENOW':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_sharenow.jpg'),
        );

      case 'PT':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_mvv.png'),
        );

      case 'INTERMODAL_PT_BIKE':
        return const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/icon_mvv_plus_bike.png'),
        );

      default:
        return const Icon(
          Icons.electric_car,
        );
    }
  }

  String mapModeStringToToolTip(String mode) {
    switch (mode) {
      case 'WALK':
        return 'zu Fuß';

      case 'CAR':
        return 'Pkw';

      case 'BICYCLE':
        return 'Fahrrad';

      case 'MOPED':
        return 'Moped';

      case 'ECAR':
        return 'E-Pkw';

      case 'EBICYCLE':
        return 'E-Fahrrad';

      case 'EMOPED':
        return 'E-Moped';

      case 'CAB':
        return 'Call a Bike';

      case 'EMMY':
        return 'Emmy';

      case 'TIER':
        return 'Tier';

      case 'FLINKSTER':
        return 'Flinkster';

      case 'SHARENOW':
        return 'Sharenow';

      case 'PT':
        return 'ÖPNV';

      case 'INTERMODAL_PT_BIKE':
        return 'ÖPNV + Fahrrad';

      default:
        return 'nicht vorhanden';
    }
  }

  AssetImage mapMobiScoreStringToPath(String mobiScore) {
    switch (mobiScore) {
      case 'A':
        return const AssetImage('assets/mobiscore/mobiscore_a.png');

      case 'B':
        return const AssetImage('assets/mobiscore/mobiscore_b.png');

      case 'C':
        return const AssetImage('assets/mobiscore/mobiscore_c.png');

      case 'D':
        return const AssetImage('assets/mobiscore/mobiscore_d.png');

      case 'E':
        return const AssetImage('assets/mobiscore/mobiscore_e.png');

      default:
        return const AssetImage('assets/mobiscore/mobiscore_e.png');
    }
  }
}
