class Counter {
  int value = 0;

  int increment() => ++value;

  int decrement() => --value;

  Future<int> futureIncrement() async {
    return ++value;
  }

  Future<int> futureDecrement() async {
    return Future.delayed(Duration(seconds: 1), () {
      return --value;
    });
  }

  Future<int> asyncThrowError() async {
    throw "throw error";
  }

  int throwError() {
    throw AssertionError('throw error');
//    throw AssertionError();
  }
}
