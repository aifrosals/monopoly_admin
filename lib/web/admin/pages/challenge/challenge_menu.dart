import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:monopoly_admin/web/admin/pages/challenge/question_menu.dart';
import 'package:monopoly_admin/web/widgets/color_picker.dart';

class ChallengeMenu extends StatelessWidget {
  const ChallengeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _colorInputController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, QuestionMenu.route);
                },
                child: SizedBox(
                  height: 80,
                  child: Card(
                    color: Colors.purple[300]!.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Manage Questions'),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.checklist_rtl_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
