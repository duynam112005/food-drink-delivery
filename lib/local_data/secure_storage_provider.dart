import 'package:food_drink_delivery/local_data/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'secure_storage_provider.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref){
  return SecureStorage();
}