import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monopoly_admin/models/slot.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:monopoly_admin/web/widgets/color_picker.dart';
import 'package:provider/provider.dart';

class EditSlotDialog extends StatefulWidget {
  final Slot slot;
  final int index;

  const EditSlotDialog({Key? key, required this.slot, required this.index})
      : super(key: key);

  @override
  State<EditSlotDialog> createState() => _EditSlotDialogState();
}

class _EditSlotDialogState extends State<EditSlotDialog> {
  late Color _color;
  XFile? _image;
  Uint8List? _webImage;
  String? _imageLink;

  @override
  initState() {
    super.initState();
    _color = widget.slot.color;
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
              'Edit Slot',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 5,
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
                          ),
                          widget.slot.initialType == 'land'
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(2.5)),
                                          image: _webImage != null
                                              ? DecorationImage(
                                                  image:
                                                      MemoryImage(_webImage!))
                                              : null),
                                      child: _webImage != null
                                          ? const SizedBox()
                                          : const Icon(Icons.add),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: TextButton(
                                          onPressed: () async {
                                            ImagePicker _imagePicker =
                                                ImagePicker();
                                            _image =
                                                await _imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (_image != null) {
                                              _webImage =
                                                  await _image!.readAsBytes();
                                              _imageLink = await boardProvider
                                                  .uploadSlotImage(
                                                      _webImage!, widget.index);
                                            }
                                            setState(() {});
                                          },
                                          child: const Text('Upload Image')),
                                    ),
                                  ],
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
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
                      boardProvider.editSlotColorWithImage(
                          widget.index, _color, _imageLink);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Edit',
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
