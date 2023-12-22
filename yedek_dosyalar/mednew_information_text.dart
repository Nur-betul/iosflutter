import 'package:flutter/material.dart';
import 'package:superbase_f/home/mednew_database_repository.dart';
import 'package:superbase_f/home/mednew_model.dart';

class MedNewInformationText extends StatelessWidget {
  final String userId;
  const MedNewInformationText({
    required this.userId,
    Key? key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MedNew>(
      future: getIt<MedNewDatabaseRepository>().getMedNewInformation(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          if (data != null) {
            return Text(data.id as String);
          }
 
          return const Text("No found");
        }
 
        return const Text("Error");
      },
    );
  }
}