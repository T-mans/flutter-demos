import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/bloc/bloc.dart';
import 'package:flutter_timer/ticker.dart';

void main() {
  var timerBloc;

  setUp(() {
    timerBloc = TimerBloc(ticker: Ticker());
  });

  test("ticker cannot be null in TimerBloc", () {
     expect(() => TimerBloc(ticker: null), throwsA(isAssertionError));
    try {
      TimerBloc(ticker: null);
    } catch (e) {
      expect(e is AssertionError, true);
      expect(e, isAssertionError);
    }
  });

  test("event ==", () {
    expect(Start(duration: 60) == Start(duration: 60), true);
    expect(Pause() == Pause(), true);
    expect(Resume() == Resume(), true);
    expect(Reset() == Reset(), true);
    expect(Tick(duration: 60) == Tick(duration: 60), true);
  });

  group("TimerBloc Test", () {
    test("initial State Ready", () {
      expect(timerBloc.initialState, Ready(60));
    });

    blocTest<TimerBloc, TimerEvent, TimerState>("state finished",
        build: () => timerBloc,
        expect: [Ready(60), Finished()],
        act: (timerBloc) async {
          timerBloc.add(Tick(duration: 0));
        });

    blocTest<TimerBloc, TimerEvent, TimerState>("state running",
        build: () => timerBloc,
        expect: [Ready(60), Running(1)],
        act: (timerBloc) async {
          timerBloc.add(Tick(duration: 1));
        });

    blocTest<TimerBloc, TimerEvent, TimerState>("state start",
        build: () => timerBloc,
        expect: [Ready(60), Running(60)],
        act: (timerBloc) async {
          timerBloc.add(const Start(duration: 60));
        });

    blocTest<TimerBloc, TimerEvent, TimerState>("state ready",
        build: () => timerBloc,
        expect: [Ready(60)],
        act: (timerBloc) async {
//          timerBloc.add(Tick(duration: 59));
          timerBloc.add(Reset());
        });

    blocTest<TimerBloc, TimerEvent, TimerState>("state paused",
        build: () => timerBloc,
        expect: [Ready(60), Running(59), Paused(59)],
        act: (timerBloc) async {
          timerBloc.add(Tick(duration: 59));
          timerBloc.add(Pause());
        });

    blocTest<TimerBloc, TimerEvent, TimerState>("state paused to state resume",
        build: () => timerBloc,
        expect: [Ready(60), Running(59), Paused(59), Running(59)],
        act: (timerBloc) async {
          timerBloc.add(Tick(duration: 59));
          timerBloc.add(Pause());
          timerBloc.add(Resume());
        });
  });
}
