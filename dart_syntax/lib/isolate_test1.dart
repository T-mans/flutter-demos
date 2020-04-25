// ignore: slash_for_doc_comments
import 'dart:io';
import 'dart:isolate';

main() async {
  var childIsolate = await createIsolate();

  Future.delayed(Duration(seconds: 3), () {
    childIsolate.kill(priority: Isolate.immediate);
    exit(0);
  });
}

SendPort childIsolateSP;

Future<Isolate> createIsolate() async {
  ReceivePort mainIsolateRp = ReceivePort();
  SendPort mainIsolateSp = mainIsolateRp.sendPort;

  mainIsolateRp.listen((Object message) {
    if (message is SendPort) {
      childIsolateSP = message;
    }
    if (message == "你好main，我建立好了") {
      childIsolateSP.send("你好child,那开始庆祝吧");
    }
  });
  return await Isolate.spawn(childIsolateEntryPoint, mainIsolateSp);
}

void childIsolateEntryPoint(SendPort mainIsolateSp) {
  ReceivePort childIsolateRP = ReceivePort();
  SendPort childIsolateSp = childIsolateRP.sendPort;
  mainIsolateSp.send(childIsolateSp);

  var greetMain = "你好main，我建立好了";

  mainIsolateSp.send(greetMain);
  print(greetMain);

  childIsolateRP.listen((Object message) async {
    if (message == "你好child,那开始庆祝吧") {
      print(message);
      print('开始庆祝');
    }
  });
}
