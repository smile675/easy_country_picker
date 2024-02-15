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
