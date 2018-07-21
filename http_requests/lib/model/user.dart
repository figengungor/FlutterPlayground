class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User.fromJson(Map<String, dynamic> jsonMap)
      : this.id = jsonMap['id'],
        this.name = jsonMap['name'],
        this.userName = jsonMap['username'],
        this.email = jsonMap['email'],
        this.address = Address.fromJson(jsonMap['address']),
        this.phone = jsonMap['phone'],
        this.website = jsonMap['website'],
        this.company = Company.fromJson(jsonMap['company']);
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final Geo geo;

  Address.fromJson(Map<String, dynamic> jsonMap)
      : street = jsonMap['street'],
        suite = jsonMap['suite'],
        city = jsonMap['city'],
        zipCode = jsonMap['zipcode'],
        geo = Geo.fromJson(jsonMap['geo']);
}

class Geo {
  final String lat;
  final String lng;

  Geo.fromJson(Map<String, dynamic> jsonMap)
      : lat = jsonMap['lat'],
        lng = jsonMap['lng'];
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        catchPhrase = jsonMap['catchPhrase'],
        bs = jsonMap['bs'];
}
