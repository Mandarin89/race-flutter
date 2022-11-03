import 'package:flutter/material.dart';
import 'package:race/entity/dropdownList.dart';
import 'package:race/ui/theme/app_colors.dart';

class RaceDropdownWidget extends StatefulWidget {
  final List<DropDownList> list;
  final EdgeInsets margin;
  const RaceDropdownWidget({super.key, required this.list, this.margin = const EdgeInsets.symmetric(horizontal: 100, vertical: 15)});

  @override
  State<RaceDropdownWidget> createState() => _RaceDropdownWidgetState();
}

class _RaceDropdownWidgetState extends State<RaceDropdownWidget> {
  DropDownList? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.list[0];
    return Center(
      child: Container(
        margin: widget.margin,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1.2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<DropDownList>(
            value: dropdownValue,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            style:
                const TextStyle(color: AppColors.mainDarkFontColor, fontSize: 14),
            onChanged: (DropDownList? value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: widget.list.map<DropdownMenuItem<DropDownList>>((DropDownList value) {
              return DropdownMenuItem<DropDownList>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
