import 'package:flutter/material.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/widgets/color_picker.dart';
import 'package:provider/provider.dart';

class AddSlotDialog extends StatefulWidget {
  final int index;

  const AddSlotDialog({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<AddSlotDialog> createState() => _AddSlotDialogState();
}

class _AddSlotDialogState extends State<AddSlotDialog> {
  String _dropdownValue = 'Land';
  int _level = 0;
  Color _color = Colors.teal[300]!;

  @override
  void initState() {
    // TODO: implement initState
    _color =
        Provider.of<BoardProvider>(context, listen: false).getRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Add Slot',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Choose Type'),
            DropdownButton<String>(
              value: _dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Land',
                'Black Hole',
                'Worm Hole',
                'Community Chest',
                'Treasure Hunt',
                'Chance',
                'Challenge',
                'RM Reward'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 7,
            ),
            _dropdownValue == 'Land'
                ? Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Choose Level'),
                          const SizedBox(
                            width: 20,
                          ),
                          DropdownButton<int>(
                            value: _level,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (int? newValue) {
                              setState(() {
                                _level = newValue!;
                              });
                            },
                            items: <int>[
                              0,
                              1,
                              2,
                              3,
                              4,
                              5,
                            ].map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                    value == 0 ? '-select-' : value.toString()),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            Color? color = await showDialog(
                                context: context,
                                builder: (context) => ColorPickerWidget(
                                      color: _color,
                                    ));
                            if (color != null) {
                              setState(() {
                                _color = color;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Choose Color'),
                                const SizedBox(
                                  width: 30,
                                ),
                                CircleAvatar(
                                  minRadius: 10,
                                  backgroundColor: _color,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  )
                : const SizedBox(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue),
                    )),
                const SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      boardProvider.addSlot(widget.index, _dropdownValue);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
