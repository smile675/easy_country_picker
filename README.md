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

-Select a Country by typing initial query
-Get Code, name, currency, continent, phone code from one single object.

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

Please send me an email "scripts.ismail@gmail" if you face any issue. or create a issue on github, i will try my best to respond.
This is just an initial release, and gradually we can improve it a lot.
