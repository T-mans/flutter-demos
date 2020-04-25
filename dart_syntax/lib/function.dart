//定义named parm function
void walk(
  String name, {
  String gender,
  int step,
}) {
  print('$name,性别$gender走了$step步');
}

//定义positional parm function
void eat(String name, [int rice, int noddles]) {
  print('$name吃了米饭$rice碗，面条$noddles碗');
}

void main({List args}) async {
  walk('LiMing', step: 9999); //这里好处是要求传递参数的名字,并且不必依赖顺序，这个是flutter大量使用的语法
  eat('Zhangsan', 3); //positional param必须按照顺序传递参数
  print(await sleep());
  print('');
  dynamicParams('红红火火，恍恍惚惚',age: 19);
  dynamicParams2('红红火火，恍恍惚惚',19);
}

Future<int> sleep() async {
  return 2333;
}

//函数的参数可以忽略类型标注，这样情况下默认是dynamic类型，相关使用参见test框架
void dynamicParams(name,{age}) {
  print(name.toString());
  print(name.runtimeType);
  print(age.runtimeType);
//  print(name.hhh);//因为name是dynamic的，所以编译期调用任何成员都不会报错
}

//下面这个证明，省略类型标注适用于任何参数
void dynamicParams2(name,[age]) {
  print(name.toString());
  print(name.runtimeType);
  print(age.runtimeType);
//  print(name.hhh);//因为name是dynamic的，所以编译期调用任何成员都不会报错
}
