// ignore: slash_for_doc_comments
/**
 * 一旦error发生，执行会跳转到最近到error处理，然后继续往下执行，代码如下：
 */

void main() {
//  walk(1)
//      .then((value) => run(value))//因为walk抛出了异常，而这之前没有error处理，所以这里的执行被忽略
//      .catchError((error) => print('error = $error'))//这里处理了walk的异常
//      .then((value) => run(value));//这里继续执行run

  walk(1) //这一段walk代码和上面的效果是一样的，因为walk的异常在run之后捕获，导致第一个run跳过执行
      .then((value) => run(value), onError: (error) => print('error = $error'))
      .then((value) => run(value));

//  walk(1)//相对上面的执行，因为我们我们捕获了walk的异常，所以run可以政策执行
//      .catchError((error) => print('error = $error'))
//      .then((value) => run(value))
//      .catchError((error) => print('error = $error'))
//      .then((value) => run(value));
}

Future<int> walk(int a) async {
  print('执行了walk');
  throw Exception("exception throw in walk");
}

Future<int> run(int a) async {
  print('执行了run');
}
