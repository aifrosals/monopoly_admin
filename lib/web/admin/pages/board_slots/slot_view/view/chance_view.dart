import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';

class ChanceView extends StatelessWidget {
  final Slot slot;
  final Function()? onSlotClick;

  const ChanceView({Key? key, required this.slot, this.onSlotClick})
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.transparent.withOpacity(0.5),
                          BlendMode.dstATop),
                      image:
                          AssetImage('assets/images/chance_background.jpg'))),
              child: Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/question.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    slot.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
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
