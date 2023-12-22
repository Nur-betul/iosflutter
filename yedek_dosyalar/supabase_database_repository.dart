import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:superbase_f/home/SupabaseTable.dart';
import 'package:superbase_f/home/mednew_database_repository.dart';
import 'package:superbase_f/home/mednew_model.dart';

class SupabaseDatabaseRepository implements MedNewDatabaseRepository {
  final Supabase _supabase;
  final MedNewSupabaseTable _mednewSupabaseTable;
 
  const SupabaseDatabaseRepository(this._supabase, this._mednewSupabaseTable);
  
  @override
  Future<MedNew> getMedNewInformation(String userId) async {
  final response = await _supabase.client
      .from(_mednewSupabaseTable.tableName)
      .select()
      .eq(_mednewSupabaseTable.idColumn, userId)
      .single();
 
  final mednewModel = MedNew.fromJson(response as Map<String, dynamic>);
  return mednewModel;
}


  @override
  Future<MedNew> updateMedNewInformation(MedNew mednewModel) async {
  await _supabase.client
      .from(_mednewSupabaseTable.tableName)
      .update(mednewModel.toJson());
  return mednewModel;
}
}


