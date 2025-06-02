import 'package:user_management_app/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.image,
    required super.username,
    required super.age,
    required super.gender,
    required super.address,
    required super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      address: Address(
        address: json['address']['address'] as String,
        city: json['address']['city'] as String,
        state: json['address']['state'] as String,
        stateCode: json['address']['stateCode'] as String,
        postalCode: json['address']['postalCode'] as String,
        country: json['address']['country'] as String,
      ),
      company: Company(
        name: json['company']['name'] as String,
        title: json['company']['title'] as String,
        department: json['company']['department'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'image': image,
      'username': username,
      'age': age,
      'gender': gender,
      'address': {
        'address': address.address,
        'city': address.city,
        'state': address.state,
        'stateCode': address.stateCode,
        'postalCode': address.postalCode,
        'country': address.country,
      },
      'company': {
        'name': company.name,
        'title': company.title,
        'department': company.department,
      },
    };
  }
} 