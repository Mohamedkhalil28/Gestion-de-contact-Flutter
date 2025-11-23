import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/contact.dart';

class ContactActions {
  static final _box = Hive.box<Contact>('contacts');

  /// Ajouter un contact
  static void addContact(BuildContext context) {
    final name = TextEditingController();
    final phone = TextEditingController();
    final email = TextEditingController();

    showDialog(
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
            onPressed: () {
              _box.add(
                Contact(
                  name: name.text,
                  phone: phone.text,
                  email: email.text,
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Ajouter"),
          )
        ],
      ),
    );
  }

  /// Modifier un contact
  static void editContact(BuildContext context, Contact contact) {
    final name = TextEditingController(text: contact.name);
    final phone = TextEditingController(text: contact.phone);
    final email = TextEditingController(text: contact.email);

    showDialog(
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
            onPressed: () {
              contact.name = name.text;
              contact.phone = phone.text;
              contact.email = email.text;
              contact.save();
              Navigator.pop(context);
            },
            child: const Text("Enregistrer"),
          )
        ],
      ),
    );
  }

  /// Supprimer un contact
  static void deleteContact(Contact contact) {
    contact.delete();
  }
}
