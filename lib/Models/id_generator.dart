import 'package:uuid/uuid.dart';

class IDGenerator {
  String ids;
  IDGenerator({
    required this.ids,
  });

  String getIDGenerator() {
    return const Uuid().v4().split('-').join();
  }
}
