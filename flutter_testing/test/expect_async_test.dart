import 'package:test/test.dart';

void main() {
  Stream<int> stream;

  setUp(() {
    stream = Stream.fromIterable([1, 2, 3]);
  });

  //The expectAsync() function wraps another function and has two jobs. First, it asserts that the wrapped function is called a certain number of times, and will cause the test to fail if it's called too often; second, it keeps the test from finishing until the function is called the requisite number of times.
  test('Stream.fromIterable() emits the values in the iterable', () {
    stream.listen(expectAsync1((number) {
      expect(number, inInclusiveRange(1, 3));
    }, count: 3));
  });
}
