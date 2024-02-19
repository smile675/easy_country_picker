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

class CountryPicker {
  static Future<Country?> selectCountry(
    BuildContext context, {
    double? height,
    ShapeBorder shape =
        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    Color? backgroundColor,
    double contentpadding = 10,
    bool showCloseButton = false,
  }) async {
    List<Map<String, String>> countries = countryList;
    countries.sort((a, b) => a['countryName']!.compareTo(b['countryName']!));

    return showModalBottomSheet<Country>(
      shape: shape,
      backgroundColor: backgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height - 40,
          padding: EdgeInsets.all(contentpadding),
          child: Column(
            children: [
              if (showCloseButton)
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(countries[index]['countryCode']!),
                          const SizedBox(width: 10),
                          Text(countries[index]['countryName']!),
                        ],
                      ),
                      onTap: () {
                        String countryCode = countries[index]['countryCode']!;
                        Map<String, String>? selectedCountry =
                            countries.firstWhere(
                          (country) => country["countryCode"] == countryCode,
                        );
                        Country country = Country.fromMap(selectedCountry);
                        Navigator.pop(context, country);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
