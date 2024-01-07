import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _saveMedicine() async {
    var uuid = Uuid();
    String id = uuid.v4(); // Generates a random UUID
    DateTime now = DateTime.now();

    await DatabaseHelper.insertMedicine({
      'id': id,
      'med_name': _nameController.text,
      'rem_time': _dateController.text,
      'created_at': now.toIso8601String(),
    });

    // Kaydetme işleminden sonra gerekli işlemleri yapın (örn. geri dönme, başarılı mesajı gösterme)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlaç Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'İlaç Adı'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Tarih ve Saati'),
            ),
            ElevatedButton(
              child: Text('KAYDET'),
              onPressed: () {
                _saveMedicine();
              },
            )
          ],
        ),
      ),
    );
  }
}

class DatabaseHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'your_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE patients(id TEXT PRIMARY KEY, med_name TEXT, rem_time TEXT, created_at TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertMedicine(Map<String, dynamic> medicine) async {
    final db = await DatabaseHelper.getDatabase();
    await db.insert(
      'patients',
      medicine,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
