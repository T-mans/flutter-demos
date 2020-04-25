bool topLevel = true;

void main() {
  var count = 66;
  print(count);
  setCount(count);
  print(count);

  var name = "李四";
  print(name);
  setName(name);
  print(name);

  print('==========');

  var person = Person("李四");
  print(person.name);
  var personBySet = setPerson(person);
  print(person.name);

  //首先明确以下，Dart中一切皆为对象，即便是内置的number或者bool也不例外,所以我们定义的所有标志符都是一个引用
  //但是为什么函数中的修改了引用的指向，依然对函数外层的引用没有影响呢
  //这是因为，函数中的参数拷贝了这个引用，所以两者指向同一个内存地址，在函数内我们对被拷贝的引用赋值使得其指向一个新的地址，所以外面的引用不受影响。

  //那么为什么针对person的修改生效了呢？这是因为拷贝的引用和原来的引用指向同一个地址，我们当然可以对原来的地址做修改。
}

void setCount(num count) {
  count = 666;
}

void setName(String name) {
  name = "张三";
}

class Person {
  String name;

  Person(this.name);
}

void setPerson(Person person) {
  person.name = "张三";
}
