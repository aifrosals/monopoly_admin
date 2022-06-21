import 'package:flutter/material.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_graphics.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/add_slot_button.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/delete_slot_button.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/widgets/single_slot_edit_button.dart';

class EditSlot extends StatefulWidget {
  final Slot slot;
  final int index;

  const EditSlot({Key? key, required this.slot, required this.index})
      : super(key: key);

  @override
  State<EditSlot> createState() => _EditSlotState();
}

class _EditSlotState extends State<EditSlot> {
  double _slotButtonsOpacity = 0.0;

  _slotButtonsAnimation(bool value) {
    setState(() {
      if (value) {
        _slotButtonsOpacity = 1.0;
      } else {
        _slotButtonsOpacity = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FittedBox(
        child: InkWell(
          onTap: () {
            setState(() {
              _slotButtonsOpacity = 1.0;
            });
          },
          onHover: (value) => _slotButtonsAnimation(value),
          child: Stack(
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${widget.index + 1}'),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 400,
                          height: 120,
                          child: SlotGraphic.getSlotWidget(widget.slot),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: AnimatedOpacity(
                    opacity: _slotButtonsOpacity,
                    duration: const Duration(milliseconds: 500),
                    child: Stack(
                      children: [
                        widget.slot.initialType != 'start' &&
                            widget.slot.initialType != 'end'
                            ? Positioned(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: FittedBox(
                                    child: AddSlotButton(
                                      index: widget.index,
                                    ))))
                            : const SizedBox(),
                        // widget.slot.initialType != 'start' &&
                        //         widget.slot.initialType != 'end'
                        //     ? Positioned(
                        //         top: 30,
                        //         left: 50,
                        //         child: SizedBox(
                        //           height: 50,
                        //           width: 50,
                        //           child: FittedBox(
                        //               child: DeleteSlotButton(
                        //             index: widget.index,
                        //           ),
                        //           ),
                        //         ))
                        //     : const SizedBox(),
                        widget.slot.initialType != 'start' &&
                            widget.slot.initialType != 'end'
                            ? Positioned(
                            top: 60,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: FittedBox(
                                  child: FittedBox(
                                    child: DeleteSlotButton(
                                      index: widget.index,
                                    ),
                                  )),
                            ))
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
