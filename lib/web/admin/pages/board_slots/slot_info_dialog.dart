import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_graphics.dart';
import 'package:provider/provider.dart';

class SlotInformationDialog extends StatelessWidget {
  final Slot slot;

  const SlotInformationDialog({Key? key, required this.slot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        SlotGraphic.getBackgroundImage(slot.type),
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.cancel_outlined)),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Name: ${slot.name}'),
                  const SizedBox(
                    height: 2,
                  ),
                  slotInfo(slot),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Show information of the slot related to the type
  /// and buying status
  Widget slotInfo(Slot slot) {
    switch (slot.initialType) {
      case 'land':
        {
          return Column(
            children: [
              getPropertyStatusInfo(slot),
              slot.status == 'for_sell'
                  ? Column(
                      children: [
                        const Text('For Urgent Sell'),
                        Text('Selling Price: ${slot.getHalfSellingPrice()}'),
                      ],
                    )
                  : Text('Upgraded Price: ${slot.updatedPrice}'),
              Text('Selling Price: ${slot.getSellingPrice()}')
            ],
          );
        }
      case 'start':
        {
          return const Text(
            'This is the starting point of the game',
            textAlign: TextAlign.center,
          );
        }
      case 'end':
        {
          return const Text(
              'This is the end point of the slot. On your next dice roll you will be going from the Start again. If you will step on this, you will get 150 credits, 20 dices, 1 item and 5 RM cash',
              textAlign: TextAlign.center);
        }
      case 'chest':
        {
          return const Text('Community chest contains random credits rewards',
              textAlign: TextAlign.center);
        }
      case 'chance':
        {
          return const Text('Get random chances of getting or losing',
              textAlign: TextAlign.center);
        }
      case 'black_hole':
        {
          return const Text('A black hole can make you go any step back',
              textAlign: TextAlign.center);
        }
      case 'challenge':
        {
          return const Text(
              'Step on this slot, answer question the questions to fill the bar and earn credits',
              textAlign: TextAlign.center);
        }
      case 'treasure_hunt':
        {
          return const Text(
              'Guess the direction of the treasure. Guess correct and get the treasure. Wrong guess will make you lose credits',
              textAlign: TextAlign.center);
        }
      case 'worm_hole':
        {
          return const Text(
              'A wormhole will take you any step further on the board',
              textAlign: TextAlign.center);
        }
      case 'reward':
        {
          return const Text(
              'Step on it to get a star, when you will have 5 stars, you will earn 50 RM cash',
              textAlign: TextAlign.center);
        }
      default:
        return const SizedBox();
    }
  }

  Widget getPropertyStatusInfo(Slot slot) {
    if (slot.owner != null) {
      return Column(
        children: [
          Text(
            'Owned by ${slot.owner!.id}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Rent: ${slot.getRent()}'),
        ],
      );
    } else {
      return const Text('For Sell');
    }
  }
}
