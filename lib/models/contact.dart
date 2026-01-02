import 'package:mongo_dart/mongo_dart.dart';

class Contact {
  ObjectId? id;
  String name;
  String phone;
  String email;

  Contact({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  // Convert to Map for MongoDB
  Map<String, dynamic> toMap() {
    return {
      if (id != null) '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  // Create from Map
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['_id'] as ObjectId?,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
