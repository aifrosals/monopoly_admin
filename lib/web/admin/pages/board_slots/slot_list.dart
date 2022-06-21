import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/screen_config.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/admin/pages/board_slots/slot_graphics.dart';
import 'package:provider/provider.dart';

class SlotList extends StatelessWidget {
  const SlotList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child:
            Consumer<BoardProvider>(builder: (context, boardProvider, child) {
          return SizedBox(
            height: ScreenConfig.safeScreenHeight - 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: boardProvider.slots.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 70,
                      child: FittedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${index + 1}'),
                            Column(
                              children: [
                                SizedBox(
                                  width: 400,
                                  height: 120,
                                  child: SlotGraphic.getSlotWidget(
                                      boardProvider.slots[index]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        }),
      ),
    );
  }
}
