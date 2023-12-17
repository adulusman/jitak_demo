import 'package:flutter/material.dart';
class CheckboxRow extends StatefulWidget {
  final List<String> labels;
  final int noOfBox;

  CheckboxRow({required this.labels, required this.noOfBox});

  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  List<bool> isCheckedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.noOfBox,
        (index) => Row(
          children: [
            Checkbox(
               side: const BorderSide(color: Color(0xffE8E8E8)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                  side: const BorderSide(color: Color(0xffE8E8E8))),
              checkColor: Colors.white,
              activeColor: const Color(0xffEE7D42),
              value: isCheckedList[index],
              onChanged: (value) {
                setState(() {
                  isCheckedList[index] = value!;
                });
              },
            ),
            Text(widget.labels[index]),
          ],
        ),
      ),
    );
  }
}
