import 'package:test/test.dart';

void main() {
  //Stream matchers,
  test('process emits status messages', () {
    // Dummy data to mimic something that might be emitted by a process.
    var stdoutLines =
        Stream.fromIterable(['Ready.', 'Loading took 150ms.', 'Succeeded!']);

    expect(
        stdoutLines,
        emitsInOrder([
          // Values match individual events.
          'Ready.',

          // Matchers also run against individual events.
          startsWith('Loading took'),

          // Stream matchers can be nested. This asserts that one of two events are
          // emitted after the "Loading took" line.
          emitsAnyOf(['Succeeded!', 'Failed!']),

          // By default, more events are allowed after the matcher finishes
          // matching. This asserts instead that the stream emits a done event and
          // nothing else.
          emitsDone
        ]));
  });
}
