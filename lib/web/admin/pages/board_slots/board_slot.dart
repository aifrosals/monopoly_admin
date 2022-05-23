import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/edit_all_slots_button.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/edit_slots/edit_slot_list.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_list.dart';
import 'package:provider/provider.dart';

class BoardSlot extends StatefulWidget {
  const BoardSlot({Key? key}) : super(key: key);

  @override
  State<BoardSlot> createState() => _BoardSlotState();
}

class _BoardSlotState extends State<BoardSlot> {
  @override
  void initState() {
    super.initState();
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);
    boardProvider.getBoardSlots(adminProvider.admin!);
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    return Column(
      children: [
        Consumer<BoardProvider>(builder: (context, boardProvider, child) {
          if (boardProvider.slotLoading) {
            return const LinearProgressIndicator();
          } else {
            return const SizedBox();
          }
        }),
        Consumer<BoardProvider>(builder: (context, boardProvider, child) {
          if (boardProvider.editSlots) {
            return EditSlotList();
          } else {
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer<BoardProvider>(
                            builder: (context, boardProvider, child) {
                          return Text(
                              'Total Slots: ${boardProvider.slots.length}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30));
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        EditAllSlotsButton()
                      ],
                    ),
                    SlotList()
                  ],
                );
              } else if (constraints.maxWidth <= 1200 &&
                  constraints.maxWidth >= 800) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Consumer<BoardProvider>(
                              builder: (context, boardProvider, child) {
                            return Text(
                                'Total Slots: ${boardProvider.slots.length}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30));
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          EditAllSlotsButton()
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SlotList(),
                    )
                  ],
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Consumer<BoardProvider>(
                              builder: (context, boardProvider, child) {
                            return Text(
                                'Total Slots: ${boardProvider.slots.length}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30));
                          }),
                          const SizedBox(
                            width: 20,
                          ),
                          EditAllSlotsButton()
                        ],
                      ),
                    ),
                    SizedBox(
                        height: ScreenConfig.blockHeight * 80,
                        child: const SlotList()),
                  ],
                );
              }
            });
          }
        }),
      ],
    );
  }
}
