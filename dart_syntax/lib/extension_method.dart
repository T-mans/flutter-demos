//介绍拓展函数
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
// ···
}

extension FancyList<T> on List<T> {
  List<T> get evenElements {
    return <T>[for (int i = 0; i < length; i += 2) this[i]];
  }
}

extension ShiftString on String {
  String operator <<(int shift) {
    return substring(shift, length) + substring(0, shift);
  }
}

extension StandardExtension<T> on T {

}

void main() {
  print('42'.parseInt());
  var list = [1, 2, 3];
  print(list.runtimeType);
  list.evenElements.forEach((value) {
    print(value);
  });

  print('hello' << 2);
}
