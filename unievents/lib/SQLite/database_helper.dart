import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unievents/userController.dart';

import '../JSON/users.dart';
import '../JSON/events.dart';

class DatabaseHelper extends ChangeNotifier {
  final databaseName = "auth.db";

  //Tables

  //Don't put a comma at the end of a column in sqlite

  String user = '''
   CREATE TABLE users (
   usrId INTEGER PRIMARY KEY AUTOINCREMENT,
   fullName TEXT,
   email TEXT,
   usrName TEXT UNIQUE,
   usrPassword TEXT,
    usrImage TEXT,
    usrType INTEGER default 1,
    isProposition int
   )
   ''';

   String userEvent= '''
      CREATE TABLE UserEvent (
        userId INTEGER,
        eventId INTEGER,
        participate BOOLEAN DEFAULT false,
        PRIMARY KEY(userId, eventId),
        FOREIGN KEY(userId) REFERENCES User(id),
        FOREIGN KEY(eventId) REFERENCES Event(id)
      )
    ''';

  String events = '''
    CREATE TABLE events (
    eventId INTEGER PRIMARY KEY AUTOINCREMENT,
    eventName TEXT,
    eventDescription TEXT,
    eventType Text,
    eventDate TEXT,
    eventStartTime TEXT,
    eventEndTime TEXT,
    repeat TEXT,
    dayOfWeek INTEGER,
    dayOfMonth INTEGER,
    month INTEGER,
    color INTEGER,
    eventImage TEXT
    )
  ''';
static Users? _currentUser;

  Users? get currentUser => _currentUser;

  static Users? getCurrentUser() {
    print(_currentUser?.usrType);

    
    return _currentUser;
  }

  void setCurrentUser(Users usr) async {
  Users? crtusr = await getUser(usr.usrName);
  _currentUser = crtusr;
  UserController().currentUser = crtusr!;
  print(currentUser?.email ?? 'toto');
  notifyListeners();
}
  //Our connection is ready
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 21, onCreate: (db, version) async {
      await db.execute(user);
      await db.execute(events);
      await db.execute(userEvent);
              //ajouter un super user
        await db.insert('users', {
          'usrName': 'admin',
          'usrPassword': 'admin',
          'usrType': 0,
          'usrImage': 'assets/images/user.png',
        });
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion <= 21) {
        var tableColumns = await db.rawQuery('PRAGMA table_info(events)');
        var tableColumnsOFUsers = await db.rawQuery('PRAGMA table_info(users)');
        var columnNames = tableColumns.map((column) => column['name']).toList();
        var columnNamesOfUsers = tableColumnsOFUsers.map((column) => column['name']).toList();

        await db.execute('DROP TABLE events');
        await db.execute(events);
      
        if(columnNames.contains('dayOfday')){
          await db.execute('ALTER TABLE events Drop COLUMN dayOfday');
        }
        
        if (!columnNames.contains('month')) {
          await db.execute('ALTER TABLE events ADD COLUMN month INTEGER');
        }
        if(!columnNames.contains('dayOfMonth')){
          await db.execute('ALTER TABLE events ADD COLUMN color INTEGER');
        }
        if (!columnNames.contains('dayOfWeek')) {
          await db.execute('ALTER TABLE events ADD COLUMN eventImage TEXT');
        }

        if (!columnNames.contains('repeat')) {
          await db.execute('ALTER TABLE events ADD COLUMN repeat TEXT');
        }
        if (!columnNames.contains('dayOfMonth')) {
          await db.execute('ALTER TABLE events ADD COLUMN dayOfMonth INTEGER');
        }
        if (!columnNames.contains('dayOfWeek')) {
          await db.execute('ALTER TABLE events ADD COLUMN dayOfWeek INTEGER');
        }

        if(!columnNames.contains('isProposition')){
          await db.execute('ALTER TABLE events ADD COLUMN isProposition INTEGER');
        }
        // if(columnNamesOfUsers.contains('patricipate')){
        //   await db.execute('ALTER TABLE user DROP COLUMN patricipate');
        // }
        print(columnNames);
        print(columnNamesOfUsers);
        if(!columnNamesOfUsers.contains('usrType')){
          await db.execute('ALTER TABLE users ADD COLUMN usrType INTEGER');
        }
        if(!columnNamesOfUsers.contains('usrImage')){
          await db.execute('ALTER TABLE users ADD COLUMN usrImage TEXT');
        }


      
      }
    });
  }

  //Function methods

//user methodes

  //log out
  void logOut() {
    _currentUser = null;
    notifyListeners();
  }
  //Authentication
  Future<bool> authenticate(Users usr) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where usrName = '${usr.usrName}' AND usrPassword = '${usr.password}' ");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  Future<int> createUser(Users usr) async {
    final Database db = await initDB();
    return db.insert("users", usr.toMap());
  }

  //Get current User details
  Future<Users?> getUser(String usrName) async {
    final Database db = await initDB();
    var res =
        await db.query("users", where: "usrName = ?", whereArgs: [usrName]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }

//events methodes (CRUD)
  // Event Methods (CRUD)

  Future<void> insertEvent(Event event) async {
    final db = await initDB();
    await db.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Event>> getAllEvents() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('events');
    return List.generate(maps.length, (i) {
      return Event.fromMap(maps[i]);
    });
  }

  Future<List<Event>> getEventsByDate(String date) async {
    final db = await initDB();

    // Convert date string to DateTime
    DateFormat inputFormat = DateFormat('MMMM dd, yyyy');
    // DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    DateTime d = inputFormat.parse(date);
    // String formattedDate = outputFormat.format(d);

    // Get the day of the week and day of the month of the selected date
    int dayOfWeek = d.weekday;
    int dayOfMonth = d.day;
    int month = d.month;

    // Fetch events from the database
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM events WHERE (eventDate <= ? AND (eventDate = ? OR repeat = 'Daily' OR (repeat = 'Weekly' AND dayOfWeek = ?) OR (repeat = 'Monthly' AND dayOfMonth = ?) OR (repeat = 'Yearly' AND month = ? AND dayOfMonth = ?)))",
        [date, date, dayOfWeek, dayOfMonth, month, dayOfMonth]);

    // final List<Map<String, dynamic>> maps = await db.query(
    //   'events',
    //   where: 'eventDate = ?',
    //   whereArgs: [date],
    // );
    return List.generate(maps.length, (i) {
      return Event.fromMap(maps[i]);
    });
  }

  Future<void> updateEvent(Event event) async {
    final db = await initDB();
    await db.update(
      'events',
      event.toMap(),
      where: 'eventId = ?',
      whereArgs: [event.eventId],
    );
  }

  Future<void> deleteEvent(int id) async {
    final db = await initDB();
    await db.delete(
      'events',
      where: 'eventId = ?',
      whereArgs: [id],
    );
  }

  //UserEvent methods
  Future<void> insertUserEvent(int userId, int eventId) async {
    final db = await initDB();
    //check if the user is already participating in the event
    var res = await db.rawQuery(
        "select * from UserEvent where userId = $userId AND eventId = $eventId");
    if (res.isNotEmpty) {
      if(res[0]['participate'] == 0){
        await db.update(
          'UserEvent',
            {'participate': 1},
          where: 'userId = ? AND eventId = ?',
          whereArgs: [userId, eventId],
        );
      }else{
        await db.update(
          'UserEvent',
            {'participate': 0},
          where: 'userId = ? AND eventId = ?',
          whereArgs: [userId, eventId],
        );
      }
      
    }else{    
      print("insert");
        await db.insert(
        'UserEvent',
        {'userId': userId, 'eventId': eventId, 'participate': true},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
  Future<void> deleteUserEvent(int userId, int eventId) async {
    final db = await initDB();
    await db.delete(
      'UserEvent',
      where: 'userId = ? AND eventId = ?',
      whereArgs: [userId, eventId],
    );
  }
}
