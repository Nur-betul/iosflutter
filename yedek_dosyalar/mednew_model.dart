import 'dart:html';

class MedNew {
  final Text id;
  final Text? whoReferenceNumber;
  final Text? innDosageFormStrength;
  final Text? productType;
  final Text? therapeuticArea;
  final Text? applicant;
  final Text? dosageForm;
  final Text? basisofListing;
  final Text? basisofAlternativeListing;
  final Text? dateofPrequalification;      

  
  const MedNew(
      {required this.id,
      this.whoReferenceNumber,
      this.innDosageFormStrength,
      this.productType,
      this.therapeuticArea,
      this.applicant,
      this.dosageForm,
      this.basisofListing,
      this.basisofAlternativeListing,
      this.dateofPrequalification});

    Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'whoReferenceNumber': whoReferenceNumber,
        'innDosageFormStrength': innDosageFormStrength,
        'productType': productType,
        'therapeuticArea': therapeuticArea,
        'applicant': applicant,
        'dosageForm': dosageForm,
        'basisofListing': basisofListing,
        'basisofAlternativeListing': basisofAlternativeListing,
        'dateofPrequalification': dateofPrequalification
      };

       static MedNew fromJson(Map<String, dynamic> json) => MedNew(
        id: json['id'] as Text,
        whoReferenceNumber: json['whoReferenceNumber'] as Text?,
        innDosageFormStrength: json['innDosageFormStrength'] as Text?,
        productType: json['productType'] as Text?,
        therapeuticArea: json['therapeuticArea'] as Text?,
        applicant: json['applicant'] as Text?,
        dosageForm: json['dosageForm'] as Text?,
        basisofListing: json['basisofListing'] as Text?,
        basisofAlternativeListing: json['basisofAlternativeListi'] as Text?,
        dateofPrequalification: json['dateofPrequalification'] as Text?,
      );


}