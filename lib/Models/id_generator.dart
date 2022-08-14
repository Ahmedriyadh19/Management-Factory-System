import 'package:uuid/uuid.dart';

class IDGenerator {
  static String getIDGenerator() {
    return const Uuid().v4().split('-').join();
  }
}
