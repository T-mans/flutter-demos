# flutter_testing

* A new Flutter application for testing demo.
* we can read official documents [here](https://pub.flutter-io.cn/packages/test)

## test function

* test function is top-level function,you can check if the results are correct by using the top-level expect function.
* test function's body should use async function:() async {}, this body is await executed in framework.

## expect function
* expect的核心是matcher，指的是Matcher类，常见的有: equal(可以省略), allOf, endWith, contains, isNot

## running test
* A single test file can be run just using ```pub run test path/to/test.dart.```
* Many tests can be run at a time using ```pub run test path/to/dir.```
* The test runner considers any file that ends with _test.dart to be a test file.
* You can select specific tests cases to run by name using pub run test -n "test name".
* To collect code coverage, you can run tests with the --coverage <directory> argument.

## Stream Matchers
* example in counter_test
* The following built-in stream matchers are available:
```
*  emits() matches a single data event.
* emitsError() matches a single error event.
* emitsDone matches a single done event.
* mayEmit() consumes events if they match an inner matcher, without requiring them to match.
* mayEmitMultiple() works like mayEmit(), but it matches events against the matcher as many times as possible.
* emitsAnyOf() consumes events matching one (or more) of several possible matchers.
* emitsInOrder() consumes events matching multiple matchers in a row.
* emitsInAnyOrder() works like emitsInOrder(), but it allows the matchers to match in any order.
* neverEmits() matches a stream that finishes without matching an inner matcher.
```




