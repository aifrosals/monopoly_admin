import 'package:flutter/material.dart';

class AddPropertyTemplateDialog extends StatelessWidget {
  const AddPropertyTemplateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 700,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Level 0 Property Template',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Row(
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
                        borderRadius: BorderRadius.all(Radius.circular(2.5)),
                      ),
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextButton(
                          onPressed: () {}, child: Text('Upload Image')),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Display Name'),
                    SizedBox(width: 100, child: TextField())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
