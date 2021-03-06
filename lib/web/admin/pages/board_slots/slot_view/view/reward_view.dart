import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';

//TODO: remove end key usage except for end slot
class RewardView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const RewardView({Key? key, required this.slot, this.onSlotClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    return InkWell(
      onTap: onSlotClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 200,
              width: 200,
              key: slot.endKey,
              decoration: BoxDecoration(
                color: slot.color,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Image.asset(
                        'assets/images/star.png',
                        scale: 1.2,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 35,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Image.asset(
                        'assets/images/star.png',
                        scale: 1.2,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 70,
                    child: Image.asset(
                      'assets/images/star.png',
                      scale: 0.8,
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 133,
                    child: Image.asset(
                      'assets/images/star.png',
                      scale: 1.2,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 170,
                    child: Image.asset(
                      'assets/images/star.png',
                      scale: 0.8,
                    ),
                  ),
                  Text(
                    slot.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
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
