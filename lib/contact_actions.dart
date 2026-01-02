import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'models/contact.dart';
import 'mongodb_service.dart';

class ContactActions {
  /// Ajouter un contact
  static Future<void> addContact(BuildContext context) async {
    final name = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Ajouter un contact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: "Nom")),
            TextField(controller: phone, decoration: const InputDecoration(labelText: "Numéro")),
            TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
          ElevatedButton(
            onPressed: () async {
              final contact = Contact(
                name: name.text,
                phone: phone.text,
                email: email.text,
              );
              await MongoDBService.addContact(contact);
              Navigator.pop(context);
            },
            child: const Text("Ajouter"),
          )
        ],
      ),
    );
  }

  /// Modifier un contact
  static Future<void> editContact(BuildContext context, Contact contact) async {
    final name = TextEditingController(text: contact.name);
    final phone = TextEditingController(text: contact.phone);
    final email = TextEditingController(text: contact.email);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Modifier le contact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: "Nom")),
            TextField(controller: phone, decoration: const InputDecoration(labelText: "Numéro")),
            TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
          ElevatedButton(
            onPressed: () async {
              contact.name = name.text;
              contact.phone = phone.text;
              contact.email = email.text;
              await MongoDBService.updateContact(contact);
              Navigator.pop(context);
            },
            child: const Text("Enregistrer"),
          )
        ],
      ),
    );
  }

  /// Supprimer un contact
  static Future<void> deleteContact(ObjectId id) async {
    await MongoDBService.deleteContact(id);
  }
}
