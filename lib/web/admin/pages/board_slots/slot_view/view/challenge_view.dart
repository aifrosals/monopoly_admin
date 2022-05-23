import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:provider/provider.dart';

class ChallengeView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const ChallengeView({Key? key, required this.slot, this.onSlotClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      minRadius: 55,
                      backgroundImage:
                          AssetImage('assets/images/challenge.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        slot.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                        width: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: LinearProgressIndicator(
                            value: 0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
