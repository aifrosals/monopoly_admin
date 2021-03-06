import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';

class StartView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const StartView({Key? key, required this.slot, this.onSlotClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSlotClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
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
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                      child: Image.asset('assets/images/rocket.png'),
                    ),
                    FittedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                            child: Text(
                              "Start Here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.money),
                              Text("20 Credits as you pass")
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
