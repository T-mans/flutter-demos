// ignore: slash_for_doc_comments
import 'dart:async';

// ignore: slash_for_doc_comments
/**
 * 测试Stream的工厂方法获取Stream
 */
main() async {
  ///注意，由于Stream本身是一个抽象类，所以你无法使用它的默认构造函数来构建stream，
  /// 事实上我们我们使用的工厂构造函数，最后都返回了一个具体的impl类，比如stream_impl.dart文件中定义的[_GeneratedStreamImpl]
  //展示value构造函数发送单一value，然后触发onDone。
  //value返回的也是单一订阅的Stream
  Stream<int> valueStream = Stream.value(1);
  valueStream.listen((entity) {
    print('entity = $entity');
  }, onDone: () {
    print('done');
  });

  //通过fromIterable获取stream
  await for (var entity in Stream.fromIterable([1, 2, 3, 4])) {
    print('iterable entity = $entity');
  }

  //下面的对象，对于一个工厂构造方法，却提供了const支持，一般在使用的情况
  print(
      '讨论使用const Stream.emtpy是否指向同一个对象：${identical(const Stream.empty(), const Stream.empty())}');
  const Stream.empty().listen((entity) {
    print('const Stream.empty do nothing');
  }, onDone: () {
    print('const Stream.empty onDone');
  });
  //重复的订阅没有问题，所以在实际编码的时候，考虑到节省内存，可以使用const来获取const value
  const Stream.empty().listen((entity) {
    print('const Stream.empty do nothing');
  }, onDone: () {
    print('const Stream.empty onDone 2');
  });

  //下面展示periodic的用法，相对独特的一个用法
  await Stream.periodic(Duration(milliseconds: 100), (int computationCount) {
    return "这里是数字:$computationCount";
  }).take(10).forEach((it) {
    print(it);
  });

  Stream.fromIterable(["hello", "world"])
      .transform(DuplicationTransformer())
      .listen((entity) {
    print(entity);
  });
}

//下面两个类提供了一个transformer的封装
class DuplicationSink implements EventSink<String> {
  final EventSink<String> _outputSink;

  DuplicationSink(this._outputSink);

  void add(String data) {
    _outputSink.add(data);
    _outputSink.add(data);
  }

  void addError(e, [st]) {
    _outputSink.addError(e, st);
  }

  void close() {
    _outputSink.close();
  }
}

class DuplicationTransformer extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) => Stream<String>.eventTransformed(
      stream, (EventSink sink) => DuplicationSink(sink));
}
