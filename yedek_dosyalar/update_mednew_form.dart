import 'package:flutter/material.dart';
import 'package:superbase_f/home/mednew_database_repository.dart';
import 'package:superbase_f/home/mednew_model.dart';

class UpdateMedNewForm extends StatefulWidget {
  final String mednewId;
  const UpdateMedNewForm({
    required this.mednewId,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateMedNewForm> createState() => _UpdateMedNewFormState();
}

class _UpdateMedNewFormState extends State<UpdateMedNewForm> {
  String? whoReferenceNumber;
  String? innDosageFormStrength;
  Text? productType;
  Text? therapeuticArea;
  Text? applicant;
  Text? dosageForm;
  Text? basisofListing;
  Text? basisofAlternativeListing;
  Text? dateofPrequalification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => setState(() {
            whoReferenceNumber = value;
          }),
        ),
        TextField(
          onChanged: (value) => setState(() {
            innDosageFormStrength = value;
          }),
        ),
        ElevatedButton(
          onPressed: _onClickUpdateUser,
          child: const Text("Update"),
        ),
      ],
    );
  }

  Future<void> _onClickUpdateUser() async {
    try {
      /*await getIt<MedNewDatabaseRepository>().updateMedNewInformation(
        MedNew(
          id: widget.mednewId,
          whoReferenceNumber: whoReferenceNumber,
          innDosageFormStrength: innDosageFormStrength,
        ),
      );*/
    } catch (e) {
      // TODO: Show proper error to users
      print("Error when updating user information");
      print(e);
    }
  }
}
