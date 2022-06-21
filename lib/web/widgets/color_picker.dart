import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatefulWidget {
  final Color color;
  const ColorPickerWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  final TextEditingController _hexInputController = TextEditingController();
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 700,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(child: Text('Pick Color')),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ColorPicker(
                    pickerColor: widget.color,
                    onColorChanged: (color) {
                      selectedColor = color;
                    },
                    colorPickerWidth: 300,
                    pickerAreaHeightPercent: 0.7,
                    enableAlpha: true,
                    displayThumbColor: true,
                    labelTypes: const [ColorLabelType.hex],
                    paletteType: PaletteType.hslWithHue,
                    pickerAreaBorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2),
                    ),
                    hexInputController: _hexInputController,
                    hexInputBar: false,
                    colorHistory: [],
                    onHistoryChanged: (colors) {}),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 368.0, bottom: 50),
                child: SizedBox(
                  width: 70,
                  child: TextField(
                    controller: _hexInputController,
                  ),
                ),
              ),
              Center(
                child: Row(
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
                          Navigator.pop(context, selectedColor);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hexInputController.dispose();
    super.dispose();
  }
}
