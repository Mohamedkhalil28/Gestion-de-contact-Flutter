import 'package:mongo_dart/mongo_dart.dart';
import '../models/contact.dart';

class MongoDBService {
  static const String _connectionString = 'mongodb://localhost:27017/contacts_db';
  static const String _collectionName = 'contacts';

  static Db? _db;
  static DbCollection? _collection;

  static Future<void> connect() async {
    _db = await Db.create(_connectionString);
    await _db!.open();
    _collection = _db!.collection(_collectionName);
  }

  static Future<void> disconnect() async {
    await _db?.close();
  }

  static Future<List<Contact>> getContacts() async {
    if (_collection == null) return [];
    final contacts = await _collection!.find().toList();
    return contacts.map((map) => Contact.fromMap(map)).toList();
  }

  static Future<void> addContact(Contact contact) async {
    if (_collection == null) return;
    await _collection!.insert(contact.toMap());
  }

  static Future<void> updateContact(Contact contact) async {
    if (_collection == null || contact.id == null) return;
    await _collection!.update(
      where.eq('_id', contact.id),
      contact.toMap(),
    );
  }

  static Future<void> deleteContact(ObjectId id) async {
    if (_collection == null) return;
    await _collection!.remove(where.eq('_id', id));
  }
}