// ignore: slash_for_doc_comments
/**
 * Dart的异步语法的核心是Future,而Stream更像是一堆future的流发送，还有一个是async function。future是An object representing a delayed computation.A Future is used to represent a potential value, or error, that will be available at some time in the future. Receivers of a Future can register callbacks that handle the value or error once it is available.
    Future类似类似Rxjava，可以添加onSuccess，onError回掉，可以添加多个success回调，Each successor is treated independently and is handled as if it was the only successor.
    Future可以配合await写出类似同步的操作，这种情况下，调用的函数必须使用async来标注：functionName() async {await future}
    使用链式的catchError的做法可以捕获执行错误，在then语法里面传递onError,注意onError或者catchError的必须使用（Error error,{StackTrace StackTrace} => void语法，否则无法触发.
    async配合函数使用，返回的一定是futrue，函数内部是否使用await是可选的，await必须在async内部使用，一般是配合future函数的，这样是让异步写法变成同步的样子，防止地狱回调。
    对于await调用，try catch语句依然适用。
    在then调用中，使用了高阶函数的声明Future<R> then<R>(FutureOr<R> onValue(T value), {Function onError});其中的FutureOr<R> onValue(T value)参数申明了一个函数参数，类型是返回FutureOr<R>传参类型为T的参数。而后者的onError声明属于可选参数，并且属于named可选参数，这里的坑是虽然这个地方没有限制函数的传参，但其实必须使用Error error,{StackTrace StackTrace}传参，否则无法被回调。
    这里面的FutureOr<R>目前从类继承结构上，不能明白为什么可以代表Future<R>或者R。
    无论是catchError还是onError的调用，都无法在链式语法里面捕获then语法的FutureOr<R> onValue(T value)内部的错误。
    另外发现，前面的onError调用会拦截error继续往下传递，当然then和catchError的链式语法中还会有新的调用，所以可以认为错误处理，处理了最近的错误，然后不再往下传递。onError中抛出的错误，可以在后续的catchError中被处理。
    证明的代码[main]：
 */
void main() {
  walk(1)
      .then((value) {
    print('获取到value了 value = $value');
    throw Exception("exception throw in walk");
  }, onError: (e) {})
      .catchError((error) => print('catch le = $error'))
      .whenComplete(() => print("Done!!!")); //类似try catch finally的写法
}

Future<int> walk(int a) async {
  print('执行了walk');
}
