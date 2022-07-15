import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';

import 'package:provider/provider.dart';

class BusinessCenterView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const BusinessCenterView({Key? key, required this.slot, this.onSlotClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSlotClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              key: slot.endKey,
              decoration: BoxDecoration(
                  color: slot.color,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Stack(
                children: [
                  slot.owner != null
                      ? Positioned(
                          right: 0,
                          left: 120,
                          child: Text(
                            'owned by ${slot.owner!.id}',
                            style: TextStyle(color: Colors.white),
                          ))
                      : const SizedBox(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            slot.image != null
                                ? Image.network(
                                    slot.image!,
                                    height: 100,
                                  )
                                : Image.asset(
                                    'assets/images/business_center.png'),
                            slot.status == 'for_sell'
                                ? Positioned.fill(
                                    child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                        'assets/images/for_sale.png'),
                                  ))
                                : const SizedBox()
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 49,
                              child: Text(
                                slot.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: 25,
                                      child: Image.asset(
                                          'assets/images/walking.png')),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  // slot.allStepCount != null &&
                                  //         slot.allStepCount![
                                  //                 userProvider.user.serverId] !=
                                  //             null
                                  //     ? Text(
                                  //         "${slot.allStepCount![userProvider.user.serverId]}",
                                  //         style: const TextStyle(
                                  //             color: Colors.white,
                                  //             fontWeight: FontWeight.bold),
                                  //       )
                                  //     : const SizedBox(),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  SizedBox(
                                      width: 25,
                                      child: Image.asset(
                                          'assets/images/dollar.png')),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '${slot.status == 'for_sell' ? slot.getHalfSellingPrice() : slot.getSellingPrice()}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  SizedBox(
                                      width: 25,
                                      child: Image.asset(
                                          'assets/images/payment.png')),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '${slot.getRent()}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
