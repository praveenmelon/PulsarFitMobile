import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

class StorageRepository {
  final Box box;

  StorageRepository({
    @required this.box,
  }) : assert(box != null);

  Future set<E>(dynamic key, E value) {
    return box.put(key, value);
  }

  E get<E>(dynamic key) {
    return box.get(key);
  }

  bool containsKey(dynamic key) {
    return box.containsKey(key);
  }

  Future delete(dynamic key) {
    return box.delete(key);
  }
}
