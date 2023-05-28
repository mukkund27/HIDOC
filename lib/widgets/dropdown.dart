
import 'package:demoproject/widgets/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final double w;
  final double h;
  const DropDown({Key? key, required this.w, required this.h}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? dropDownValue;
  List<String> list = ["one", "two"];

  @override
  Widget build(BuildContext context) {
    return Container(width: Responsive.isDesktop(context) ? widget.w/3:widget.w,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          iconStyleData: const IconStyleData(
              icon: Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Icon(Icons.arrow_drop_down),
              )),
          alignment: Alignment.center,
          value: dropDownValue,
          hint: const Text("Critical Care"),
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(value: value, child: Align(alignment: Alignment.center, child: Text(value)));
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
          },
        ),
      ),
    );
  }
}