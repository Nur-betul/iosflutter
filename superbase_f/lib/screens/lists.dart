import 'package:flutter/material.dart';
import 'package:superbase_f/screens/addmedicine.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({Key? key}) : super(key: key);

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  late Future<List<Map<String, dynamic>>> _future;
  TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  final List<Map<String, String>> medications = [
    {'name': 'ASPIRIN', 'date': '9 Ocak 20.00', 'method': 'oral'},
    {
      'name': 'Hametan',
      'date': '9 Ocak 10.00',
      'method': 'deri üzerine sürülerek kullanılır'
    },
    {'name': 'Bricanyl', 'date': '10 Ocak 11.00', 'method': 'oral'},
  ];

  var mednew;

  List<Widget> _builEventDetails() {
    return [
      Text(
        'Event Name: ${mednew['event_name']}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Text('Event Data: ${mednew['event_name']}'),
      Text('Event Type: ${mednew['event_type']}'),
      Text('Event Date: ${mednew['event_date']}'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication List'),
      ),
      body: ListView.builder(
        itemCount: medications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(medications[index]['name']!),
            subtitle: Text(
                'Date: ${medications[index]['date']!}, Method: ${medications[index]['method']!}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  medications.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMedicinePage()),
            );
          },
          label: Text('İLAÇ EKLE'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.green),
    );
  }
}
