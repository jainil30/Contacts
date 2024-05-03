import 'dart:developer';

import 'package:sqflite/sqflite.dart';

import '../models/Category.dart';
import '../models/Contact.dart';

//Database Service
class ContactsDatabase {
  //This class follows Singleton Pattern
  //As same object will be returned every time its constructor will be called
  static final ContactsDatabase _databaseService = ContactsDatabase._internal();
  factory ContactsDatabase() => _databaseService;
  ContactsDatabase._internal();

  static Database? _database;

  //Method to get database object
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  //Method to initialize database
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/contacts.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  //Method to create tables and views when database is created
  void _onCreate(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE Category(category_id INTEGER PRIMARY KEY AUTOINCREMENT ,category_name TEXT)');

      await db.execute(
          'CREATE TABLE Contact(contactId INTEGER PRIMARY KEY AUTOINCREMENT ,firstname TEXT,lastname TEXT,mobileNumber TEXT,email TEXT,category TEXT,imagePath TEXT)');
    } catch (e) {
      print(e);
    }
    log('TABLE CREATED');
  }

  //Return List of  all categories
  Future<List<Category>> getCategories() async {
    List<Category> categories = <Category>[];
    try {
      final db = await _databaseService.database;

      var data = await db.rawQuery('SELECT * FROM Category');
      categories =
          List.generate(data.length, (index) => Category.fromJson(data[index]));
      print(categories.length);
    } catch (e) {
      print(e);
    }

    return categories;
  }

  //To insert Category in database
  Future<void> insertCategory(Category category) async {
    try {
      final db = await _databaseService.database;
      // var data = await db.rawInsert(
      //     'INSERT INTO Category(category_name) VALUES(?)',
      //     [category.categoryName]);
      int insertedId =
          await db.insert('Category', {'category_name': category.categoryName});

      // log('inserted $data');
      log('Inserted category with ID: $insertedId');
    } catch (e) {
      print(e);
    }
  }

  //To edit category
  Future<void> editCategory(String category, int id) async {
    try {
      final db = await _databaseService.database;
      var data = await db.rawUpdate(
          'UPDATE Category SET category_name=? WHERE category_id=?',
          [category, id]);
      log('updated $data');
    } catch (e) {
      print(e);
    }
  }

  //To Delete category from database
  void deleteCategory(int id) async {
    try {
      final db = await _databaseService.database;
      await db.delete('Category', where: 'category_id= ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  //To search category by its id
  Future<String> getCategoryById(int id) async {
    List<Category> categories = <Category>[];
    try {
      final db = await _databaseService.database;
      String query = 'SELECT * FROM Category WHERE category_id=?';
      var data = await db.rawQuery(query, [id]);
      categories =
          List.generate(data.length, (index) => Category.fromJson(data[index]));
      print(categories.length);
    } catch (e) {
      print(e);
    }
    return categories[0].categoryName!;
  }

  /*
  Contacts functions
   */

  //Returns list of contacts
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = <Contact>[];
    try {
      final db = await _databaseService.database;
      var data = await db.rawQuery('SELECT * FROM Contact');
      contacts =
          List.generate(data.length, (index) => Contact.fromJson(data[index]));
      print(contacts.length);
    } catch (e) {
      print(e);
    }
    return contacts;
  }

  //To search contacts based on name
  Future<List<Contact>> getContactsByName(String name) async {
    List<Contact> contacts = <Contact>[];
    try {
      final db = await _databaseService.database;
      String query = 'SELECT * FROM Contact WHERE firstname Like ?';
      var data = await db.rawQuery(query, [name]);
      contacts =
          List.generate(data.length, (index) => Contact.fromJson(data[index]));
      print(contacts.length);
    } catch (e) {
      print(e);
    }

    return contacts;
  }

  //Return list of contact based on category
  Future<List<Contact>> getContactsByCategory(String category) async {
    List<Contact> contacts = <Contact>[];
    try {
      final db = await _databaseService.database;
      String query = 'SELECT * FROM Contact WHERE category =?';
      var data = await db.rawQuery(query, [category]);
      contacts =
          List.generate(data.length, (index) => Contact.fromJson(data[index]));
      print(contacts.length);
    } catch (e) {
      print(e);
    }
    return contacts;
  }

  //To insert contact in database
  Future<void> insertContact(Contact contact) async {
    try {
      final db = await _databaseService.database;
      print("Image in db  : ${contact.imagePath}");
      // await db.insert("Contact", {});
      var data = await db.rawInsert(
          "INSERT INTO Contact(firstname, lastname,mobileNumber, email,category,imagePath) VALUES(?,?,?,?,?,?)",
          [
            contact.firstname,
            contact.lastname,
            contact.mobileNumber,
            contact.email,
            contact.category,
            contact.imagePath
          ]);
      // contact.toJson());
      log('inserted $data');
    } catch (e) {
      print(e);
    }
  }

  //To edit contact information
  Future<void> editContact(Contact contact, int editContactId) async {
    final db = await _databaseService.database;
    var data;
    try {
      data = await db.rawUpdate(
          'UPDATE Contact SET firstname=?,lastname=?,mobileNumber=?, email=?,category=?,imagePath=? WHERE contactId=?',
          [
            contact.firstname,
            contact.lastname,
            contact.mobileNumber,
            contact.email,
            contact.category,
            contact.imagePath,
            editContactId
          ]);
    } catch (e) {
      print(e);
    }
    log('updated $data');
  }

  //To delete contact information
  void deleteContact(int id) async {
    try {
      final db = await _databaseService.database;
      await db.delete('Contact', where: 'contactId = ?', whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }
}
