import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../JSON/users.dart';
import '../JSON/events.dart';


class DatabaseHelper{
  final databaseName = "auth.db";

  //Tables

  //Don't put a comma at the end of a column in sqlite

  String user = '''
   CREATE TABLE users (
   usrId INTEGER PRIMARY KEY AUTOINCREMENT,
   fullName TEXT,
   email TEXT,
   usrName TEXT UNIQUE,
   usrPassword TEXT
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
    color TEXT,
    eventImage TEXT
    )
  '''; 

  //Our connection is ready
  Future<Database> initDB ()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 3, onCreate: (db, version) async {
  await db.execute(user);
  await db.execute(events);
}, onUpgrade: (db, oldVersion, newVersion) async {
  if (oldVersion < 3) {
    await db.execute('ALTER TABLE events ADD COLUMN eventType TEXT');
  }
});
  }

  //Function methods

//user methodes 

  //Authentication
  Future<bool> authenticate(Users usr)async{
    final Database db = await initDB();
    var result = await db.rawQuery("select * from users where usrName = '${usr.usrName}' AND usrPassword = '${usr.password}' ");
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  //Sign up
  Future<int> createUser(Users usr)async{
    final Database db = await initDB();
    return db.insert("users", usr.toMap());
  }


  //Get current User details
  Future<Users?> getUser(String usrName)async{
    final Database db = await initDB();
    var res = await db.query("users",where: "usrName = ?", whereArgs: [usrName]);
    return res.isNotEmpty? Users.fromMap(res.first):null;
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
    print('date: $date' );
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'eventDate = ?',
      whereArgs: [date],
    );
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



}