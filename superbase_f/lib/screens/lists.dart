import 'package:flutter/material.dart';
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
  List<String> _suggestions = [];
  String? _selectedDrug;

  @override
  void initState() {
    super.initState();
    _future = fetchData(); // Start fetching data when the widget initializes
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response =
        await Supabase.instance.client.from('MedNew').select().execute();

    return (response.data as List).cast<Map<String, dynamic>>();
  }

  void filterMedicines(String value) {
    setState(() {
      _searchTerm = value.toLowerCase();
    });

    if (_searchTerm.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    _future.then((medicines) {
      setState(() {
        _suggestions = medicines
            .where((medicine) => medicine['innDosageFormStrength']
                .toString()
                .toLowerCase()
                .contains(_searchTerm))
            .map((medicine) => medicine['innDosageFormStrength'].toString())
            .toList();
      });
    });
  }

  void selectDrug(String drugName) {
    setState(() {
      _selectedDrug = drugName;
    });
    // Do something with the selected drug, e.g., navigate to another page
    print('Selected drug: $_selectedDrug');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search by drug name...',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                filterMedicines(_searchController.text);
              },
            ),
          ),
          onChanged: (value) {
            filterMedicines(value);
          },
        ),
      ),
      body: _suggestions.isNotEmpty
          ? ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final drugName = _suggestions[index];
                return ListTile(
                  title: Text(drugName),
                  onTap: () {
                    selectDrug(drugName);
                  },
                  selected: _selectedDrug == drugName,
                  selectedTileColor: Colors.blue.withOpacity(0.3),
                );
              },
            )
          : SizedBox(), // If no search result, show nothing
    );
  }
}
