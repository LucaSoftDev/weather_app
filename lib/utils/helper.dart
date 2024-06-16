import 'dart:math';

class Helper {
  static String generateSalt(int length) {
    const charSet =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    final rand = Random.secure();
    final codeUnits = List.generate(length, (index) {
      int randIndex = rand.nextInt(charSet.length);
      return charSet.codeUnitAt(randIndex);
    });

    return String.fromCharCodes(codeUnits);
  }
}
