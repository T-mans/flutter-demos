// ignore: slash_for_doc_comments
import 'dart:async';

// ignore: slash_for_doc_comments
/**
 * 通过Stream Controller获取Stream.
 * 通过查看Stream的源码，因为Stream本身没有add等添加事件的方法，只有Stream Controller的方法才能更详细的操纵一个类
 * StreamController和Stream都是抽象类，可以认为这两个类定义了主要的类行为
 * 这里继续延伸的话，Future类同处于async库，同样是抽象类，具体的操作类其实都是一些impl子类。
 */
main() async {
//创建一条处理int类型的流
  StreamController<int> numController = StreamController.broadcast(); //获取广播流
//  StreamController<int> numController = StreamController();//获取非广播流

  //设置StreamController的流监听
  //onData配置事件获取的处理
  //onError用于配置错误发生时候，获取error和stacktrace
  //cancelOnError:是一个bool变量，用于确定当onError发生后，stream是否继续工作。
  print("numController持有的是广播流吗：${numController.stream.isBroadcast}");

  numController.stream.listen((event) {
    print('event = $event');
  }, onError: (e, stackTrace) {
    print('发生了错误：error = $e');
  }, onDone: () {
    print('执行了onDone');
  }, cancelOnError: false);

  numController.sink.add(-1);
  numController.sink.addError(Exception("故意给stream添加一个error"));
  numController.sink.add(-2);
  await numController.addStream(getNumbers(),
      cancelOnError: true); //把source stream的数据
  numController.sink.add(-3); //这里为了证明source stream的流cancelOnError不影响
  await numController.addStream(getNumbers2(),
      cancelOnError:
          false); //注意addStream是一个异步future操作，必须等待被添加的source执行了onDone，或者onError（cancelOnError等于True）才会返回。
  numController.add(-5);
  await numController.close(); //close之后，触发onDone操作
//  numController.add(-1);//close之后，触发Bad state: Cannot add event after closing异常
//  //注意，close本身不会取消流的订阅，如果是非广播流，再次订阅触发异常Bad state: Stream has already been listened to.
//  //但是针对广播流，虽然在close之后继续添加订阅不会触发异常，但是因为流已经关闭，无法发送事件，这个订阅没有任何意义。
//  numController.stream.listen((entity) {
//    print('新订阅流的事件：entity = $entity');
//  });
}

Stream<int> getNumbers2() {
  StreamController<int> otherNumController = StreamController(); //获取非广播流
  otherNumController.add(
      -100); //这里说一个细节，这没有调用.sink来添加，但是根据源码，sink只是暴露了sink接口，真是的添加操作，仍然使用的streamcontroll来进行
  otherNumController.addError("在getNumbers第一次抛出异常");
  otherNumController.add(-200);

  otherNumController.addError("在getNumbers第二次抛出异常");

//  otherNumController.close();
  otherNumController.sink.close();
  return otherNumController.stream;
}

Stream<int> getNumbers() async* {
  yield 90;
  yield 91;
  yield 92;
  throw "nimei"; //抛异常之后，无法继续执行，所以async generator function无法模拟一次cancelOnError。
//  yield 93;
}
