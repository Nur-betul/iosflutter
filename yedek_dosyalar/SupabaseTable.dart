abstract class SupabaseTable {
  const SupabaseTable();
  String get tableName;
}

class MedNewSupabaseTable implements SupabaseTable {
  const MedNewSupabaseTable();

  @override
  String get tableName => 'MedNew';

  String get idColumn => 'id';
  String get whoReferenceNumberColumn => "whoReferenceNumber";
  String get innDosageFormStrengthColumn => 'innDosageFormStrength';
  String get productType => 'productType';
  String get therapeuticArea => 'therapeuticArea';
  String get applicant => 'applicant';
  String get dosageForm => 'dosageForm';
  String get basisofListing => 'basisofListing';
  String get basisofAlternativeListing => 'basisofAlternativeListing';
  String get dateofPrequalification => 'dateofPrequalification';
}
