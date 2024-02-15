library easy_country_picker;

import 'package:easy_country_picker/data/country_data.dart';
import 'package:flutter/material.dart';

import 'country_model.dart';

class CountrySelectionField extends StatefulWidget {
  final Function(Country?)? onCountrySelect;
  final InputDecoration inputDecoration;

  const CountrySelectionField({
    super.key,
    this.onCountrySelect,
    this.inputDecoration = const InputDecoration(hintText: "Select Country"),
  });

  @override
  State<CountrySelectionField> createState() => _CountrySelectionFieldState();
}

class _CountrySelectionFieldState extends State<CountrySelectionField> {
  List<Map<String, String>> countries = countryList;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return countries
            .where((country) => country["countryName"]!
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .map((country) => country["countryName"]!);
      },
      onSelected: (String? selection) {
        // if (selection == null) {
        //   return;
        // }
        Map<String, String>? selectedCountry = countries.firstWhere(
          (country) => country["countryName"] == selection,
        );
        Country country = Country.fromMap(selectedCountry);

        if (widget.onCountrySelect != null) {
          widget.onCountrySelect!(country);
        }
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: widget.inputDecoration,
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Material(
          elevation: 4.0,
          child: SizedBox(
            height: 200.0,
            child: ListView(
              children: options
                  .map((option) => ListTile(
                        title: Text(option),
                        onTap: () => onSelected(option),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
