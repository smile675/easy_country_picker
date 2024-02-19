import 'package:easy_country_picker/country_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_country_picker/easy_country_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Country Picker Demo'),
    );
  }
}

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
                inputDecoration: InputDecoration(
                  prefixIcon: const Icon(Icons.public),
                  hintText: 'Select Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
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
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await CountryPicker.selectCountry(
                  context,
                ).then((value) => {
                      if (value != null)
                        {
                          setState(() {
                            country = value;
                          })
                        }
                    });
              },
              child: const Text("Select Country"),
            ),
          ],
        ),
      ),
    );
  }
}
