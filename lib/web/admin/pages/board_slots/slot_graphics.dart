import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/values.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_info_dialog.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/black_hole_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/business_center_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/challenge_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/chance_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/chest_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/city_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/condo_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/end_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/house_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/land_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/reward_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/shop_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/start_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/theme_park_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/treasure_hunt_view.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_view/view/worm_hole_view.dart';

class SlotGraphic {
  static BoxDecoration getBackgroundImageDecoration(String type) {
    switch (type) {
      case 'black_hole':
        {
          return const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/blackhole-bg.jpg')));
        }
      case 'worm_hole':
        {
          return const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/wormhole.jpg')));
        }
      case 'treasure_hunt':
        {
          return const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/tresurehunt-bg.webp')));
        }
      default:
        {
          return const BoxDecoration();
        }
    }
  }

  static String getBackgroundImage(String type) {
    switch (type) {
      case 'black_hole':
        {
          return 'assets/images/blackhole-bg.jpg';
        }
      case 'worm_hole':
        {
          return 'assets/images/wormhole.jpg';
        }
      case 'treasure_hunt':
        {
          return 'assets/images/tresurehunt-bg.webp';
        }
      default:
        {
          return 'assets/images/slot_bg.png';
        }
    }
  }

  static Widget getSlotWidget(Slot slot) {
    switch (slot.type) {
      case 'start':
        {
          return StartView(
            slot: slot,
          );
        }
      case 'land':
        {
          return LandView(
            slot: slot,
          );
        }
      case 'house':
        {
          return HouseView(
            slot: slot,
          );
        }
      case 'chest':
        {
          return ChestView(
            slot: slot,
          );
        }
      case 'chance':
        {
          return ChanceView(
            slot: slot,
          );
        }
      case 'black_hole':
        {
          return BlackHoleView(
            slot: slot,
          );
        }
      case 'condo':
        {
          return CondoView(
            slot: slot,
          );
        }
      case 'theme_park':
        {
          return ThemeParkView(
            slot: slot,
          );
        }
      case 'challenge':
        {
          return ChallengeView(
            slot: slot,
          );
        }
      case 'shop':
        {
          return ShopView(
            slot: slot,
          );
        }
      case 'business_center':
        {
          return BusinessCenterView(
            slot: slot,
          );
        }
      case 'city':
        {
          return CityView(
            slot: slot,
          );
        }
      case 'treasure_hunt':
        {
          return TreasureHuntView(
            slot: slot,
          );
        }
      case 'worm_hole':
        {
          return WormHoleView(
            slot: slot,
          );
        }
      case 'reward':
        {
          return RewardView(
            slot: slot,
          );
        }
      case 'end':
        {
          return EndView(
            slot: slot,
          );
        }
      default:
        return const SizedBox();
    }
  }
}
