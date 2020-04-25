// ignore: slash_for_doc_comments
/**
 * 对于test2代码稍加修改，可以证明我们可以在onError里面返回值来处理错误的情况：

    输出：
    执行了walk
    error = Instance of 'Error'
    执行了run 参数a = 99

    onError中如果不执行返回，则a = null；
 */

void main() {
  walk(1).then((value) => run(value), onError: (error) {
    print('error = $error');
    return 99;
  }).then((value) => run(value));
}

Future<int> walk(int a) async {
  print('执行了walk');
  throw Exception("exception throw in walk");
}

Future<int> run(int a) async {
  print('执行了run 参数a = $a');
}
