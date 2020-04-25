import 'package:flutter_testing/counter.dart';
import 'package:test/test.dart';

void main() {
  //test for class，根据官方的示例，普通的同步执行，没必要使用async的body
  test('Counter single test', () {
    final counter = Counter();
    expect(counter.increment(), 1); //验证同步函数可以直接用value来验证
    expect(counter.increment(), 2); //验证增加后继续增加，之前的状态是使用了
    expect(counter.decrement(), 1); //继续在之前的状态基础上变化
  });

  //if we have several tests that are related to one another, combine them using the group function
  group('Counter with setUpAll', () {
    Counter counter;

    //注意：setUpAll存在于test和flutter_test框架，不能同时引入
    setUpAll(() {
      counter = Counter(); //在group执行前，做一次注入
    });

    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      expect(counter.increment(), 1);
    });

    test('value should be decremented', () {
      counter.decrement();

      expect(counter.value, 0); //这里因为Counter定义在group，所以执行收到上面的影响
    });
  });

  group('Counter with setUp', () {
    Counter counter;

    //setUp可以是async的，框架内部会使用await确保setUp从外到内首先执行完毕
    setUp(() {
      counter = Counter(); //new Counter every test begins
    });

    //tearDown可以是异步函数，框架内部没有看到对于tearDown的强制await执行
    tearDown(() {
      counter = null; //用于每个test结束后清理，击败test失败也会调用
    });

    test('value should start at 0', () {
      expect(counter.value, 0);
    });

    test('value should be incremented', () {
      expect(counter.increment(), 1);
    });

    test('value should be decremented', () {
      expect(counter.decrement(), -1);
    });

    //对于异步执行，body使用异步函数，从而可以在里面使用await函数,深入框架，这个body作为闭包，是使用await执行的
    test('value should be increment with Future await execute', () async {
      expect(await counter.futureDecrement(),
          -1); //测试Future执行的测试，事实证明，必须使用await，才能保证执行结束
      expect(counter.futureDecrement(),
          completion(-2)); //可以使用completion来确保匹配异步执行函数
    });

    test('async error', () async {
      expect(counter.asyncThrowError(), throwsA('throw error'));
    });

    //参照throwsA的说明，对于同步函数的异常，推荐使用一个异步函数
    test('sync error test1', () {
      expect(() async {
        counter.throwError();
      }, throwsA(TypeMatcher<Error>()));
    });

    test('use try catch for exception test', () {
      try {
        counter.throwError();
      } catch (e, s) {
        expect(e, allOf([
          TypeMatcher<AssertionError>(),
          isNot(TypeMatcher<Exception>()),
          predicate((AssertionError e) => (e.message as String) == "throw error"),//这里类似一个自由定义的matcher,我们校验了e的message
        ]));
      }
    });
  });
}
