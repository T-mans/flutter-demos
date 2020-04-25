class A {
  final String name;

  const A(this.name);
}

main() {
  var a = A("Bob");
  a = A("Bob");
//  var b = A("Bob");

//  print(a == b);

//  const c = A("Bob");
  const d = A("Bob");

  print(a == d);
}