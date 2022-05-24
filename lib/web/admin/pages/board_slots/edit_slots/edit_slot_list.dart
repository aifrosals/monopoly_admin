import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/edit_slots/edit_slot.dart';
import 'package:provider/provider.dart';

class EditSlotList extends StatelessWidget {
  const EditSlotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);

    return SizedBox(
      height: ScreenConfig.safeScreenHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 12,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Consumer<BoardProvider>(
                    builder: (context, boardProvider, child) {
                      return SizedBox(
                        height: ScreenConfig.safeScreenHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ReorderableListView(
                            onReorder: (int oldIndex, int newIndex) => boardProvider
                            .rearrangeListAction(oldIndex, newIndex),
                        children: boardProvider.editableSlots
                            .asMap()
                            .entries
                            .map((e) => EditSlot(
                                  slot: e.value,
                                  index: e.key,
                                  key: Key(e.key.toString()),
                                ))
                            .toList(),
                      ),
                          // child: ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: boardProvider.slots.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return Center(child: EditSlot(slot: boardProvider.slots[index], index: index));
                          //     }),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Consumer<BoardProvider>(
                    builder: (context, boardProvider, child) {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Edit Board Slots',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Consumer<BoardProvider>(
                            builder: (context, boardProvider, child) {
                          if (boardProvider.slotLoading) {
                            return const CircularProgressIndicator();
                          } else {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      primary: Colors.blue,
                                      side: BorderSide(color: Colors.blue),
                                    ),
                                    onPressed: () => boardProvider.cancelEdit(),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.blue),
                                    )),
                                const SizedBox(
                                  width: 50,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue),
                                    onPressed: () =>
                                        boardProvider.saveEditableSlots(
                                            adminProvider.admin!),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            );
                          }
                        }),
                      ],
                        ),
                      );
                    }),
              ))
        ],
      ),
    );
  }
}
