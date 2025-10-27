import 'dart:convert';

class Address {
  final String street;
  final String city;
  final String country;

  Address({required this.street, required this.city, required this.country});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'country': country,
    };
  }
}

class Contact {
  final String type;
  final String number;

  Contact({required this.type, required this.number});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      type: json['type'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'number': number,
    };
  }
}

class User {
  final String name;
  final String email;
  final Address address;
  final List<Contact> contacts;

  User({
    required this.name,
    required this.email,
    required this.address,
    required this.contacts,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var contactsFromJson = json['contacts'] as List;
    List<Contact> contactList =
    contactsFromJson.map((e) => Contact.fromJson(e)).toList();

    return User(
      name: json['name'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      contacts: contactList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address.toJson(),
      'contacts': contacts.map((e) => e.toJson()).toList(),
    };
  }
}

void main() {
  String jsonString = '''
  {
    "name": "Nguyen Trong Nhan",
    "email": "nhannt.miya@gmail.com",
    "address": {
      "street": "8 Ha Van Tinh",
      "city": "Da Nang",
      "country": "Viet Nam"
    },
    "contacts": [
      {
        "type": "home",
        "number": "123456789"
      },
      {
        "type": "work",
        "number": "987654321"
      }
    ]
  }
  ''';

  final jsonMap = jsonDecode(jsonString);

  final user = User.fromJson(jsonMap);

  print('--- Thông tin người dùng ---');
  print('Tên: ${user.name}');
  print('Email: ${user.email}');
  print('Địa chỉ: ${user.address.street}, ${user.address.city}, ${user.address.country}');
  print('\nDanh bạ liên hệ:');
  for (var contact in user.contacts) {
    print('- ${contact.type}: ${contact.number}');
  }

  print('\n--- Dạng JSON sau khi encode lại ---');
  print(jsonEncode(user.toJson()));
}
