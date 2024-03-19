import 'package:hive/hive.dart';

class CacheManager<T> {
  CacheManager(this._boxName);
  final String _boxName;

  Future<Box<T>> _openBox() async {
    final Box<T> box = await Hive.openBox<T>(_boxName);
    return box;
  }

  Future<void> add(T data) async {
    final Box<T> box = await _openBox();
    await box.add(data);
  }

  Future<void> addAll(List<T> data) async {
    final Box<T> box = await _openBox();
    await box.addAll(data);
  }

  Future<void> update(int index, T newData) async {
    final Box<T> box = await _openBox();
    await box.putAt(index, newData);
  }

  Future<void> delete(int index) async {
    final Box<T> box = await _openBox();
    await box.deleteAt(index);
  }

  Future<List<T>> getAll() async {
    final Box<T> box = await _openBox();
    return box.values.toList();
  }

  Future<void> clear() async {
    final Box<T> box = await _openBox();
    box.clear();
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}
