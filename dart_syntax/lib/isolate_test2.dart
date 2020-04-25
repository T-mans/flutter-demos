// ignore: slash_for_doc_comments
/**
 * 展示使用flutter compute计算来简化isolate的使用
 * 这里只是展示语法，因为compute是flutter foundation库的封装，所以在Dart command-line app里面无法引用
 */

main() async {
//  await compute(fib,45);
}

//斐波那契数列计算第N项
int fib(int n) {
  int number1 = n - 1;
  int number2 = n - 2;

  if (n == 1) {
    return 0;
  } else if (n == 0) {
    return 1;
  } else {
    return (fib(number1) + fib(number2));
  }
}
