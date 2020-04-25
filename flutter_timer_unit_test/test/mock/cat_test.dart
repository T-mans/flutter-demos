import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/mock/cat.dart';
import 'package:mockito/mockito.dart';

// Mock class
class MockCat extends Mock implements Cat {}

main() {
  Cat cat;

  setUp(() {
    // Create mock object.
    cat = MockCat();
  });

  group("mock cat test", () {
    test("test cat sleep", () {
      expect(cat.sleep(), null);
      when(cat.sleep()).thenReturn(Cat().sleep());
      expect(cat.sleep(), Cat().sleep());
    });

    test("test cat walk", () {
      expect(cat.walk(), null);
      when(cat.walk()).thenReturn(Cat().walk());
      expect(cat.walk(), Cat().walk());
    });
  });
}
