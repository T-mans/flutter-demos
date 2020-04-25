// ignore: slash_for_doc_comments
import 'dart:math';

// ignore: slash_for_doc_comments
/**
 * Set Test 是为了证明，Set中，重复元素的判定是基于Hashcode和==操作符的，
 * 首先判断hash值，不相等，直接添加
 * 其次判定==是否返回true，如果为false，认定为不相同元素，进行添加
 * 最后认定为相同元素，进行添加
 * 下面是伪代码：
 * if(a.hashcode != b.hashcode) {
 *    addData
 * } else if(a != b) {
 *    addData
 * } else {
 *    return
 * }
 */
main(List<String> arguments) {
  var a1 = A();
  var a2 = A();

  Set set = <A>{};
  set.add(a1);
  set.add(a2);
  print(set);
}

class A {
  @override
  bool operator ==(other) {
    print('执行了==');
    return true;
  }

//
  @override
  int get hashCode {
    print('执行了hashCode');
    return 1 + Random().nextInt(100);
  }
}
