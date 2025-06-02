import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String username;
  final int age;
  final String gender;
  final Address address;
  final Company company;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.username,
    required this.age,
    required this.gender,
    required this.address,
    required this.company,
  });

  String get fullName => '$firstName $lastName';

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        image,
        username,
        age,
        gender,
        address,
        company,
      ];
}

class Address extends Equatable {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final String country;

  const Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.country,
  });

  @override
  List<Object> get props => [address, city, state, stateCode, postalCode, country];
}

class Company extends Equatable {
  final String name;
  final String title;
  final String department;

  const Company({
    required this.name,
    required this.title,
    required this.department,
  });

  @override
  List<Object> get props => [name, title, department];
}