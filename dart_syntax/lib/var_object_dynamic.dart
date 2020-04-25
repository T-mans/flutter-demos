// ignore: slash_for_doc_comments

// ignore: slash_for_doc_comments
/**
 * 官方的定义一针见血：The type dynamic is a static type which is a supertype of all other types, just
    like Object, but it it differs from other types in that the static analysis assumes
    that every member access has a corresponding member with a signature that
    admits the given access.
 * 也就是说，dynamic的核心不同在于：它假定并承认可以访问任何member，即便这个member不存在，这一点也只在运行时候抛出
 */
main(List<String> arguments) {
  //dynamic
  dynamic x = 1;
  x = 'Bob';
  print(x);
  print(x.length);
//  print(x.jjjjjjjjjjjjjjdsljjhsidfsdf); //这个在编译期不会报错，this cause runtime error:Unhandled exception:NoSuchMethodError: Class 'String' has no instance getter 'size'.
  print('===============================');

  //Object
  Object y = 1;
  y = "Bob";
  print(y);
//  print(y.length);//this compile-time wrong,only Object's member is allowed.
  print('===============================');

  //var，类型推导其实在编译期间就确定了type
  var a = 'hal';
//  a = 123;//this is compile-time wrong
  print(a);
  print(a.isEmpty);
}
