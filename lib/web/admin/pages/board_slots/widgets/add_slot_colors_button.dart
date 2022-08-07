import 'package:flutter/material.dart';
import 'package:monopoly_admin/config/regex_utils.dart';

class AddSlotColorsButton extends StatefulWidget {
  const AddSlotColorsButton({Key? key}) : super(key: key);

  @override
  State<AddSlotColorsButton> createState() => _AddSlotColorsButtonState();
}

class _AddSlotColorsButtonState extends State<AddSlotColorsButton> {
  final TextEditingController _controller = TextEditingController();
  bool _next = false;
  List<String?> _colors = [];
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
                builder: (context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                            _colors = RegexUtils.getColors(
                                                _controller.text);
                                            setState(() {
                                              _next = true;
                                            });
                                          },
                                          child: const Text('Next')),
                                    ],
                                  )
                                : const SizedBox(),
                            (_next && _colors.isNotEmpty)
                                ? Column(
                                    children: [
                                      Text(
                                        '${_colors.length} Color(s) found. Do you want to update the colors fo the slots?',
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Back')),
                                          const SizedBox(
                                            width: 100,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                _colors = RegexUtils.getColors(
                                                    _controller.text);
                                                setState(() {
                                                  _next = true;
                                                });
                                              },
                                              child: const Text('Update')),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
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
                          ],
                        ),
                      ),
                    ));
          },
          child: const Text(
            'Edit Colors',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
