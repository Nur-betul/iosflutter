import 'package:get_it/get_it.dart';
import 'package:superbase_f/home/mednew_model.dart';

abstract class MedNewDatabaseRepository {
  Future<MedNew> getMedNewInformation(String userId);
  Future<MedNew> updateMedNewInformation(MedNew userModel);
}

  GetIt getIt = GetIt.instance;