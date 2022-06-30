import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/p_slot_template_provider.dart';
import 'package:monopoly_admin/web/widgets/message_dialog_ui.dart';
import 'package:provider/provider.dart';

class AddPropertyTemplateDialog extends StatefulWidget {
  final int level;

  const AddPropertyTemplateDialog({Key? key, required this.level})
      : super(key: key);

  @override
  State<AddPropertyTemplateDialog> createState() =>
      _AddPropertyTemplateDialogState();
}

class _AddPropertyTemplateDialogState extends State<AddPropertyTemplateDialog> {
  XFile? _image;
  Uint8List? _webImage;
  final TextEditingController _displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);

    return Dialog(
      child: SizedBox(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<PSlotTemplateProvider>(
              builder: (context, pSlotTemplateProvider, child) {
            if (pSlotTemplateProvider.saveLoading) {
              return const SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (pSlotTemplateProvider.error != '') {
              return const Center(child: MessageDialogUi());
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Level ${widget.level} Property Template',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2.5)),
                              image: _webImage != null
                                  ? DecorationImage(
                                      image: MemoryImage(_webImage!))
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
                                ImagePicker _imagePicker = ImagePicker();
                                _image = await _imagePicker.pickImage(
                                    source: ImageSource.gallery);
                                if (_image != null) {
                                  _webImage = await _image!.readAsBytes();
                                }
                                setState(() {});
                              },
                              child: const Text('Upload Image')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: TextField(
                            controller: _displayNameController,
                            decoration: InputDecoration(
                              labelText: "Display Name",
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                        onPressed: () async {
                          if (_webImage != null) {
                            pSlotTemplateProvider.addTemplate(
                                _webImage!,
                                adminProvider.admin!,
                                widget.level,
                                _displayNameController.text);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  @override
  dispose() {
    _displayNameController.dispose();
    super.dispose();
  }
}
