<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A Flutter package that provides a country picker widget for selecting countries along with important resources a country has.

## Features
- when user start typing the country name in the textfield it will suggest country name based on user input.
- user can choose the country from the suggestions.
- this will return a Country object which includes
   1. Country code,
   2. Country name,
   3. Currency
   4. Phone code,
   5. Continent.
   so you can use any data you require.

## Getting started

Just install the package and start using

## Usage

-Can be useful in a registration form where you need to get user country.
-user no need to input their phone code ore currency code manually, rather you can provide those on based on their country selection.

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Country? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              child: CountrySelectionField(
                onCountrySelect: (val) {
                  setState(() {
                    country = val;
                  });
                },
                inputDecoration:
                    const InputDecoration(prefixIcon: Icon(Icons.map)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Selected Country Details"),
                      Text("Country Code: ${country?.countryCode}"),
                      Text("Country Name: ${country?.countryName}"),
                      Text("Phone Code: ${country?.phoneNumberPrefix}"),
                      Text("Continent: ${country?.continentName}"),
                      Text("Currency: ${country?.currencyCode}"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

## Additional information

Class Country in country_model file.
```
class Country {
  String? countryCode;
  String? countryName;
  String? currencyCode;
  String? phoneNumberPrefix;
  String? continentName;

  Country({
    this.countryCode,
    this.countryName,
    this.currencyCode,
    this.phoneNumberPrefix,
    this.continentName,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      countryCode: map['countryCode'],
      countryName: map['countryName'],
      currencyCode: map['currencyCode'],
      phoneNumberPrefix: map['phoneNumberPrefix'],
      continentName: map['continentName'],
    );
  }
}
```

List of Countries
A list of Map<String, String> which contains data for all countries in country_data file.
```
List<Map<String, String>> countryList = [
  {
    "countryCode": "AD",
    "countryName": "Andorra",
    "currencyCode": "EUR",
    "phoneNumberPrefix": "+376",
    "continentName": "Europe"
  },
  {
    "countryCode": "AE",
    "countryName": "United Arab Emirates",
    "currencyCode": "AED",
    "phoneNumberPrefix": "+971",
    "continentName": "Asia"
  },
  {
    "countryCode": "AF",
    "countryName": "Afghanistan",
    "currencyCode": "AFN",
    "phoneNumberPrefix": "+93",
    "continentName": "Asia"
  },
  ... all countries data
]
```

Class CountrySelectionField
this take two args
1. final Function(Country?)? onCountrySelect;
   this will return Country object based on user selection.
2. final InputDecoration inputDecoration;
   this will update the how the textfield will look like.

Size of Textfield:
The textfield does not have any specific size, so wrap with a Sizedbox in order to give your prefered size.
```
 body: SizedBox(
        width: 100,
        child: CountrySelectionField(),
      ),
```


Please send me an email "scripts.ismail@gmail" if you face any issue. or create a issue on github, i will try my best to respond.
This is just an initial release, and gradually we can improve it a lot. If you are developer dont hasitate to make any upgrade in this package in githup rep.
