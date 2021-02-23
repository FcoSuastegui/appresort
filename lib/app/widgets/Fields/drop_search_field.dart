import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropSearchField extends StatelessWidget {
  final String errorText, label, selectedItem;
  final bool showSelectedItem, showClearButton;
  final List<String> items;
  final double height;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String> onChanged, popupItemDisabled;

  const DropSearchField({
    Key key,
    @required this.label,
    @required this.items,
    this.errorText,
    this.showSelectedItem = true,
    this.showClearButton = true,
    this.onChanged,
    this.popupItemDisabled,
    this.height = 70,
    this.padding,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownSearch<String>(
        dropdownSearchDecoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelStyle: GoogleFonts.lato(
            fontSize: 15.0,
            color: Colors.grey[600],
          ),
          errorText: errorText,
        ),
        mode: Mode.MENU,
        showSelectedItem: showSelectedItem,
        items: items,
        label: label,
        selectedItem: selectedItem,
        showClearButton: showClearButton,
        onChanged: onChanged,
        popupItemDisabled: popupItemDisabled,
        //popupItemDisabled: (String s) => s.startsWith('I'),
      ),
    );
  }
}
