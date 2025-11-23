import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/contact.dart';
import 'contact_actions.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Contact>('contacts');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Contacts"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => ContactActions.addContact(context),
        child: const Icon(Icons.add),
      ),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Contact> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text("Aucun contact ajouté"),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final contact = box.getAt(index)!;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Text(
                      contact.name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text("${contact.phone}\n${contact.email}"),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => ContactActions.editContact(context, contact),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => ContactActions.deleteContact(contact),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
