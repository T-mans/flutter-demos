//抽象类A和B，A拥有一个实现好的方法（这个方法是我们测试重点，会不会被抹平实现）
//其中B implement A并添加抽象方法
//类C继承A并实现B

abstract class A {
  void walk() {
    print('A Walk');
  }

  void sleep();
}

abstract class B implements A {
  void run();
}

class C extends A implements B {
  @override
  void run() {
    // TODO: implement run
  }

  @override
  void sleep() {
    // TODO: implement sleep
  }

//这个测试证明，A作为被C extends的对象，首先相关的实现会被使用还不是被同样implement A的B接口抹平walk的实现。
}
