import 'package:flutter_test/flutter_test.dart';

void main() {
  var mainVar = 'MainVar';

  setUp(() {
    print('Main setUp');
  });

  setUpAll(() {
    print('Main setUpAll');
  });

  tearDown(() {
    print('Main tearDown');
  });

  tearDownAll(() {
    print('Main tearDownAll');
  });

  group('outerGroup', () {
    setUp(() {
      print('outerGroup setUp');
    });

    setUpAll(() {
      print('outerGroup setUpAll');
    });

    tearDown(() {
      print('outerGroup tearDown');
    });

    tearDownAll(() {
      print('outerGroup tearDownAll');
    });

    group('innerGroup', () {
      setUp(() {
        print('innerGroup setUp');
      });

      setUpAll(() {
        print('innerGroup setUpAll');
      });

      tearDown(() {
        print('innerGroup tearDown');
      });

      tearDownAll(() {
        print('innerGroup tearDownAll');
      });

      test('test for execute order 1', () {
        print('test started================');
        expect(1, 1);
        print('test ended==================');
      });

      test('test for execute order 2', () {
        print('test started================');
        expect(1, 1);
        print('test ended==================');
      });
    });
  });
}
