import 'package:food_drink_delivery/storage/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'secure_storage_provider.g.dart';

@riverpod
SecureStorage secureStorage(Ref ref){
  return SecureStorage();
}