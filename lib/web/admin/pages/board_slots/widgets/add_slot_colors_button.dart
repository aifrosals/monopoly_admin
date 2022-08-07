import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/regex_utils.dart';
import 'package:monopoly_admin/providers/admin_provider.dart';
import 'package:monopoly_admin/providers/board_provider.dart';
import 'package:provider/provider.dart';

class AddSlotColorsButton extends StatefulWidget {
  const AddSlotColorsButton({Key? key}) : super(key: key);

  @override
  State<AddSlotColorsButton> createState() => _AddSlotColorsButtonState();
}

class _AddSlotColorsButtonState extends State<AddSlotColorsButton> {
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const AddSlotColorsDialog());
          },
          child: const Text(
            'Edit Colors',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class AddSlotColorsDialog extends StatefulWidget {
  const AddSlotColorsDialog({Key? key}) : super(key: key);

  @override
  State<AddSlotColorsDialog> createState() => _AddSlotColorsDialogState();
}

class _AddSlotColorsDialogState extends State<AddSlotColorsDialog> {
  bool _next = false;
  List<String?> _colors = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);
    final boardProvider = Provider.of<BoardProvider>(context, listen: false);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Colors in Bulk '),
              SizedBox(
                height: 200,
                child: TextField(
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Add Colors",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              !_next
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close')),
                        const SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _colors = RegexUtils.getColors(_controller.text);
                              setState(() {
                                _next = true;
                              });
                              debugPrint(
                                  'colors length ${_colors.length} next $_next');
                            },
                            child: const Text('Next')),
                      ],
                    )
                  : const SizedBox(),
              (_next && _colors.isNotEmpty)
                  ? Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: '${_colors.length}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(
                                  text:
                                      'Color(s) found. Do you want to update the colors fo the slots?',
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _next = false;
                                  });
                                },
                                child: const Text('Back')),
                            const SizedBox(
                              width: 100,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  boardProvider.updateSlotColors(
                                      adminProvider.admin!, _colors);
                                  Navigator.pop(context);
                                },
                                child: const Text('Update')),
                          ],
                        ),
                      ],
                    )
                  : _next
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('No color is detected'),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _next = false;
                                  });
                                },
                                child: Text('Back'))
                          ],
                        )
                      : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
