//The special, required, top-level function where app execution starts.
import 'package:meta/meta.dart';

main(List<String> arguments) {
  var xx = XX();
  xx.walk();
  print(xx is A);
  print(xx is B);
  print(xx is C);
  print(xx is D);
  print((xx as D) is C);
  C c = xx as C;
  print(c is D);
  print((xx as E) is D);
}

abstract class A {
  @protected
  @mustCallSuper
  void walk() {
    print('A walk');
  }
}

//on语法，可以指定多个类，中间用逗号分隔
mixin B on A {
  void walk() {
    super.walk();
    print('B walk');
  }
}

mixin C on A {
  void walk() {
    super.walk();
    print('C walk');
  }
}

mixin D on A {
  void walk() {
    super.walk();
    print('D walk');
  }
}

class E {
  void walk() {
    print('E walk');
  }
}

//extends with implements是顺序是固定的
@Todo("Bob", "fjdls")
class XX extends A with B, C, D implements E {
  @override
  void walk() {
    super.walk();
    print('XX walk');
  }

  void sleep() {}
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
