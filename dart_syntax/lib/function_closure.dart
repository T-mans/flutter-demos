//闭包的常用场景，还有flutter控件的点击事件。比如以下模仿widget的写法

typedef VoidCallback = void Function();

class Widget {
  VoidCallback onTap;


  Widget({this.onTap});
}

//展示函数传参的闭包
Widget getWidget(String name) {
  var b = Widget(onTap: () {
    print('$name被点击了');
  });
  name = "BOM";
  return b;
}

void main() {
//  //这里展示对于一个普通的外层可访问变量（不超过作用域）
//  var name = "李四";
//  var widgetByNew = Widget(onTap: () {
//    print('$name被点击了'); //这里触发对name的闭包，当然业务里面可能是更复杂的业务数据，比如列表对应的cell数据
//  });
//  widgetByNew.onTap();
//  name = "张三"; //我们修改被闭包的引用指向
//  widgetByNew.onTap(); //这里看出引用发生了变化对结果有影响，所以我认为函数的闭包，可以类比对象持有某个引用
//
//  //这里展示对函数的参数的闭包，似乎不同于常规的对于外层闭包,对于theName的修改不会触发被闭包的改变。
//  print('=========这里展示函数的闭包===============');
//  var theName = "李四";
//  var widgetByFunction = getWidget(theName);
//  widgetByFunction.onTap();
//  theName = "张三";
//  widgetByFunction.onTap();

  print('====下面是倒计时的展示=====');
  var theIndex = 5;
  if (false) {
    //这里是倒计时的一种函数传递参数被闭包的写法
    tick(ticks: theIndex).listen((int number) {
      print("当前number = $number");
    });
    theIndex = 3;
  } else {
    //这里我们同样展示非函数传参被闭包，那么被闭包的引用改变之后引起的闭包执行的问题
    Stream.periodic(Duration(seconds: 1), (x) => theIndex - x - 1)
        .take(theIndex)
        .listen((int number) {
      print("当前number = $number");
    });
    theIndex = 3;
  }

  //以上两者其实引出的是Dart中函数的值传递问题。这个在value_pass_or_reference_pass.dart有更详细的论述。
}

//在这个例子里面，匿名函数(x) => ticks - x - 1就闭包了ticks
Stream<int> tick({int ticks}) {
  return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
      .take(ticks);
}


