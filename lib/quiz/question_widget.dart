import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_client/quiz/options_widget.dart';
import 'package:game_client/quiz/model/question.dart';
import 'package:game_client/routes.dart';
import 'package:get/get.dart';

class QuestionWidget extends StatefulWidget {
  QuestionWidget({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Center(
            child: Image.asset(
              'lib/images/villan.png',
              width: 200,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(widget.question.text, style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 32),
        Expanded(
            child: OptionsWidget(
          question: widget.question,
          onClickedOption: (option) {
            if (widget.question.isLocked) {
              return;
            } else {
              setState(() {
                widget.question.isLocked = true;
                widget.question.selectedOption = option;
              });
            }
          },
        )),
        Center(child: widget.question.isLocked ? buildElevatedButton() : Text(""))
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Get.toNamed(Routes.result);
        });
      },
      child: Text("Claim reward"),
    );
  }
}
