import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  List<int> list = List<int>.generate(100, (int index) => index + 1);
  test("Check Card Validity", () {
    expect(checkCard("49927398716"), true);
  });
  test("Check Card Validity", () {
    expect(checkCard("1852"), false);
  });
}
