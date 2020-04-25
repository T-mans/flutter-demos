// ignore: slash_for_doc_comments
import 'dart:async';

// ignore: slash_for_doc_comments
/**
 * 通过asynchronous generator function获取Stream，用于lazily produce a sequence of values
 * 测试Stream的await for循环结合try catch语法
 * 展示了针对stream的await for异常的处理，try catch在捕获异常之后，stream终止了发送事件
 */

//通过Async Generator function获得stream
Stream<int> increasingNumbers() async* {
  var i = 0;
  while (true) {
    if (i < 10 || i > 10) {
      yield i++;
    } else {
      throw Exception("i = 10");
    }
  }
}

main() async {
  try {
    await for (var entity in increasingNumbers()) {
      print("entity = $entity");
    }
  } catch (e) {
    print(e);
  }
}
