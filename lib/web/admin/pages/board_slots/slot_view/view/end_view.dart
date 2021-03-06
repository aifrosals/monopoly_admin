import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';

class EndView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const EndView({Key? key, required this.slot, this.onSlotClick})
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
                  color: slot.color.withAlpha(148),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: slot.color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                        child: Image.asset('assets/images/flag.png'),
                      ),
                      FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "It is not",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              slot.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                            Text(
                              "Amazing Rewards",
                              style: TextStyle(color: Colors.yellow),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                        child: Image.asset('assets/images/chest-pro.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
