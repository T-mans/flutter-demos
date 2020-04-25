class Person {
  Teacher get teacher => _teacher;
  Teacher _teacher = Teacher("Bob");
}

class Teacher {
  String name;
  Teacher(this.name);
}

main() {
  var person = Person();
  print(identical(person.teacher, person.teacher));;
}