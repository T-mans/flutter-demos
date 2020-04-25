# A app demo for Dart Syntax.

### this document is a supplement for [official tour document](https://dart.dev/guides/language/language-tour)
### this document focus on what is used frequently but the official document didn't explain in detail.

### 重要的概念
1.  Dart中皆为对象，所有的对象都是class的实例，所有对象都直接或者间接继承于Object。即便是numbers，functions，null也是个对象
2.  Dart是强类型语言，但是类型声明不是强制的，可以通过类型推导获得，如果希望明确没有类型，可以使用[dynamic],注意：如果仅仅是想表达一个可以使用任何objects，应该使用Object。[dynamic的使用介绍](https://dart.dev/guides/language/effective-dart/design#do-annotate-with-object-instead-of-dynamic-to-indicate-any-object-is-allowed)
3.  Dart支持泛型，支持泛型类和泛型函数。Dart的泛型是存在在运行时的，这意味这我们可以判定一个```object is List<int>```是Ok的
4.  Dart支持top-level，class-level,instance-level的functions（比如main函数），variable。
5.  Dart的访问控制不同于java，Dart可见性控制仅仅是library级别，如果一个对象是用_开头来命名的，那么就是library可见，否则就是到处可见的(当然Library还有export的控制)
6.  标志符使用字母或者下划线（_）开头，后面还可以使用数字进行任意组合
### [Dart的关键词](https://dart.dev/guides/language/language-tour#keywords) 
* abstract :用于声明抽象类
* dynamic:用于申明不要类型的需求，关于它和object还有var的区别，demo里放在lib文件夹下面的var_object_dynamic文件下面。
* implements:实现接口，由于Dart中没有专门的接口，每一个类都是一个隐式的接口，implements其实实现的是类定义的协议
* show:用于库的部分导入
* hide：用于库的部分隐藏
* as:类型转换,错误的类型转换会抛出异常(比如：type 'String' is not a subtype of type 'int' in type cast)，对于null值的转换不会有任何异常
* if else 条件语句
* import 导入包
* static 声明class-level function or variable
* assert：用于develop期间，做断言测试，正式运行的包不会执行
* enum 声明枚举
* in 用于for-in循环语法
* super：用于召唤父类
* async：用于声明异步函数
* export：用于声明对外暴露的类
* interface:这个关键词应该是被移除了，官方的点击链接也是指向stack overflow的讨论
* switch case default：用于分支的语法，default必须放置在最后一项。
* await：用于async函数的同步调用
* extends：用于继承一个类
* is：用于判断是否是某种类型，对于null值的判断只会判定为Null
* sync：用于同步Generator语法，返回一个Iterable
* break：用于switch case语法用于终止向下一个case的执行，用于循环，终止当前循环
* continue:用于跳过循环的某一次，继续执行下一轮循环
* external：用于声明某个实现是平台相关的，比如Object的==，hashcode等方法都标注为这个。比如:[这个讨论](https://stackoverflow.com/questions/24929659/what-does-external-mean-in-dart)
* library：用于声明一个library的名字，通常在一个包的lib下面的直接层级的dart文件内，定义：library name
* this：用于指代当前类的对象本身
* factory：用于修饰构造函数，声明为一个factory constructor，和普通构造函数的区别是，这里可以使用return语句。For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.
* mixin:用于声明一个只能用于with语法的类，提供了介于extends和implements的混合能力
* throw：用于抛出一个除了null之外的对象，通常用于抛出Exception. throw null会抛异常的（Unhandled exception: Throw of null.）
* try on catch finally:try语法用于包裹执行体，on用于检测特定的exception，catch语法用于全部的exception，finally用于无论是否异常一定执行的语句块
* false true：用于声明bool值，属于编译期常量。
* new:用在构造函数之前，目前dart这个关键词是可选的
* class：用于声明一个类
* final：用于声明一个只能被赋值一次的值
* null：声明一个null值，所有对象默认值就是null
* const：声明一个编译期常量，用于dart的基本数据类型和拥有const构造函数的类
* typedef ：也被称为：function-type alias,用于给函数声明一个名字，typedef只针对函数，并且包含了函数的返回值，传参类型等签名信息。是比Function更加严格的约束
* for:用于for循环，包含常规的for循环和for-in循环
* operator:用于操作符重写，语法是：returnType operator overridableOperator(param) {function body}
* var:用于声明一个引用，但是不指明引用的类型，而是使用类型推导
* covariant：用于申明重写函数的参数的协变，也就是在子类中函数参数可以使用原来参数的子类型
* Function ：用于声明函数类型
* part：用于声明一个dart文件包含另外一个dart文件，被包含的dart文件使用part of来声明自己是某个dart文件的一部分，二者是配套使用的
* void：声明不用返回特定类型的函数,同样可以作为泛型比如```Future<void>```,[这里有一篇很不错的文档](https://medium.com/dartlang/dart-2-legacy-of-the-void-e7afb5f44df0)
* get set:用于申明getter和setter函数，语法是:```returnType get propertyName(){function body} ``` ```set propertyName(oneParam){function body}```
* rethrow:用于catch语法中重新抛出，```rethrow;```不用跟具体的异常类型。
* while do:用于while或者do-while循环
* deferred：用于延迟加载，用于flutter_web项目，语法是：import "package:xxx" deferred as yyy,其中yyy作为库引用的别称
* return：用于函数的出口,循环终止
* with：和mixin组合，是dart中介于extends和implements的一种类组合方案
* set：声明Set数据结构，Set内元素不允许重复,判断的依据是hashcode和==操作符，当其中一个不同的时候就会认为是不同的。
* yield：用于Generator语法：用来发送value。在synchronous generator返回类型是Iterable<T>,在asynchronous generator中返回Stream<T>   

### [Variables](https://dart.dev/guides/language/language-tour#variables)  
```
//const value和const reference唯一不同的地方在于,前者保存reference的identifier可以指向新的instance。
const topLevelConstReference = ['Bob'];//top level的const 引用,这里同样使用了类型推导，当然指定类型也是ok的
var topLevelConstValue = const ['Bob'];//top level的const value，使用类型推导
class TheVariable {
  static const classLevelConstReference = ['Bob']; //如果定义一个class level的const，必须使用static修饰。事实上因为const是编译期常量，必须使用static修饰。
  static var classLevelConstValue = ["Bob"];//class level的const value
  var instanceLevelValue = ['Bob']; //使用var关键词，隐式的使用了类似了类型推导。你无法定义一个instance level的const value，因为const是编译器常量
  var instanceLevelConstValue = const ["Bob"]; //this show define of const value,not const reference,这种情况，constValue可以重新指向新的值。
}
```
### [Built-in types](https://dart.dev/guides/language/language-tour#built-in-types)  
* numbers:numbers中父类是num，包含int和double，int是64的(在js是54位的)，double是64位的。注意点是这些家伙默认值是null，不是0。
* strings:String在Dart中是UTF-16 code units，支持字符串模版，多行字符串(被'''包裹的字符串,仍然解析转义)，以及raw string(r'string'可以不处理转义的)
* booleans:bool类型有三个值：true，false，null。三者都是编译期常量，注意在if语句中使用了null会报错：boolean expression must not be null,当然这里有个快速处理的办法就是使用if(bool ?? false)
* lists:Dart没有Array对象，取而代之的是List，代表ordered group of objects,Dart中有...和...?操作符号，可以快速的把一组list添加到另外一组list。还有collection if和collection for语法来简化list创建
* sets:Dart中set是唯一元素的集合，这代表== hashcode中至少有一个是不同的（hashcode是==的必要条件）。As of Dart 2.3, sets support spread operators (... and ...?) and collection ifs and fors, just like lists do.
* maps:map is an object that associates keys and values.As of Dart 2.3, maps support spread operators (... and ...?) and collection if and for, just like lists do
* runes:runes are the UTF-32 code points of a string.
* [symbols](https://dart.dev/guides/language/language-tour#symbols):represents an operator or identifier declared in a Dart program.
    
### [Functions](https://dart.dev/guides/language/language-tour#functions)  
函数重点是：函数在Dart中同样是对象，类型是Function，所以可以像操作class一样使用Function，比如赋值给一个引用，作为函数的传参等。  
函数的定义语法
```
returnType functionName(param) {
    expressions optional;
    return expr;
}
```
函数支持重写，不支持重载，也即是在Dart中同一个类内不允许有同名的函数（因为可选参数的存在，其实重载已经没有意义）。  
对于单行函数可以使用=>来直接返回,比如：bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;  
对于函数，有两种参数： required and optional.  
对于optional参数，包含两种： named or positional。两种不能共存  
named params包裹在大括号内声明：void enableFlags({bool bold, bool hidden}) {...}，可以是使用@required来要求必须传递的named param  
positional params包裹在中括号声明：String say(String from, String msg, [String device]){}  
对于可选参数，可以使用=来定义默认值，否则默认值是null，  
getters和setter是特殊的函数，用于提供read和write的控制，每个instance field包含隐式的getter and|or setter，  
所有函数都有返回值，如果不指定，return null被隐式的添加到function body(void 除外) 
Every app must have a top-level main() function, which serves as the entrypoint to the app. The main() function returns void and has an optional List<String> parameter for arguments.  
async functions: 也就是异步函数，is a function whose body is marked with the async modifier.异步函数的返回是Future
函数的想等性：作为对象，函数也可以做想等比较，top-level和class函数永远是相等的，但是Instance函数的相等必须是同一个instance的函数才ok  
- 拓展函数：
定义语法：
```
extension <extension name> on <type> {
  (<member definition>)*
}

e.g:
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  //define this api as package private
  double _parseDouble() {
    return double.parse(this);
  }
}

Extensions can have generic type parameters. For example, here’s some code that extends the built-in List<T> type with a getter, an operator, and a method:
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => <List<T>>[sublist(0, at), sublist(at)];
}
```

### [Lexical scope](https://dart.dev/guides/language/language-tour#lexical-scope)
在Dart中，词法的作用范围取决于layout of the code。  
简单说就是取决于大括号的范围，在大括号定义的变量的作用范围就是当前大括号，或者内部嵌套的括号，函数等。
并且严格遵循先定义后使用的规则。

### [Lexical closures（词法闭包)](https://dart.dev/guides/language/language-tour#lexical-closures)
官方的定义：A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.  
所以闭包在Dart里面只是针对函数对象，并且是这个对象引用了lexical scope内的其他数据。
闭包可以理解为函数把一个变量捕获到函数内部，从而可以跟随函数被传递。类似一个对象的一个字段被赋值。

### [Operators操作符](https://dart.dev/guides/language/language-tour#operators)
操作符有很多种，包含单目的，双目的等等，一部分是[可以重写的操作符](https://dart.dev/guides/language/language-tour#overridable-operators)  
==操作符定义在Object中，默认实现是测定两个对象是不是同一个，当然这个操作符可以被重写，同时应该重写hashcode method.  
在Dart中，仍然存在短路与&&和短路或||的操作，我们建议使用短路操作符。而&和|操作符应该值用于Bit操作  
[Object]顺便提一下：这个类包含一个空的构造函数，==函数，hashcode属性，toString函数，noSuchMethod函数，和runtimeType属性  
因为null的特殊性，说明一下。null在Dart中的类型是Null（重写了toString方法），null在运行时为单例的，所以相关的==操作返回true  
对于声明了类型的null值，比如：String name = null,在运行时只会获取Null类型的行为，所以在null值上的操作后果，可以通过Null类型来判定  
比如：null值上面调用method或者properties，不会有空指针异常而是noSuchMethod错误(属性调用的默认是get或者set操作)  
介绍几个常用的有用的操作符：
* a ??= b 用于a为null的情况下赋值,
* expr1 ?? expr2如果expr1不是null，返回expr1，否则返回expr2。这个在if语句中用于防止被判定的bool为null很好用
* .. 级联操作符，allow you to make a sequence of operations on the same object
* ?. Conditional member access。当被调用的是null的时候，不会触发noSuchMethod异常，而是直接返回null，和上面两个操作符可以配合使用
下面展示了一个操作符的重写
```
class OperatorVectorDemo {
  double x, y;

  OperatorVectorDemo(this.x, this.y);

  OperatorVectorDemo operator +(OperatorVectorDemo other) {
    return OperatorVectorDemo(this.x + other.x, this.y + other.y);
  }
}
```
### [Control flow statements](https://dart.dev/guides/language/language-tour#control-flow-statements)
Dart中有以下几种流程控制，没有特别的用法，assert同样只有在debug环境是打开的。
- if and else
- for loops
- while and do-while loops
- break and continue
- switch and case
- assert
### [Exceptions](https://dart.dev/guides/language/language-tour#exceptions)
在Dart中，没有Checked Exception，也就是系统不强制你捕获异常  
没有被捕获的异常会引起isolate挂起，也就是当前isolate被终止了  
Dart包含Exception和Error，二者都继承于Object（而不是类似java属于Throwable子类）（前者用于向用户提供一个failure的信息，后者通常表示一个program failure比如OOM，用户不应该试图捕获Error而是解决它  
对于Dart而言，throw可以是任何none-null的类型，而不局限于Exception。  
catch一个异常，用于阻止异常的传播并处理他，除非rethrow它，语法类似于  
```
try{}
on XXXException catch{e,s}
```
其中：on XXXException是可选的，如果参数s也是可选的，代表StackTrace,如果使用on不使用catch，那么参数都是可选的  
finally用于无论异常是否发生，都要执行的代码块，类似于java，在finally中使用return语句可以刷新函数的返回（仅用于只是探讨，不建议finally做return）
### [Class](https://dart.dev/guides/language/language-tour#classes)
Dart is an object-oriented language with classes and mixin-based inheritance,Every object is an instance of a class, and all classes descend from Object. Mixin-based inheritance means that although every class (except for Object) has exactly one superclass, a class body can be reused in multiple class hierarchies.  
注意，针对对象的属性访问，建议使用?.操作符，可以避免null的问题  
构造函数：  
包含默认的构造函数（使用类名，空参，这个可以被重写），构造函数同样可以包含可选参数，也就是包含named和positional参数。  
如果提供了有参数的构造函数，或者只提供了NamedConstructor，则不再提供默认的空参构造函数。  
可以声明const构造函数，这要求类的instance variable都是final的,  
只有声明了const构造函数的情况下，才可以在调用的时候声明const reference或者const value，这样在做==比对的时候返回true，如果只是普通调用，则在运行时生成普通的instance对象。  
声明了const构造函数的，必须在NamedConstructor中给final字段赋值  
默认而言，构造函数调用父类unnamed,no-argument构造函数（如果父类没有这个构造函数，子类必须手动的指定调用父类特定的构造函数），如果包含 initializer list则il最先执行，顺序是：  
1. [initializer list](https://dart.dev/guides/language/language-tour#initializer-list)(这个可以用于NamedConstructor或者常规的,在构造函数的参数之后，用：分隔，赋值语句用逗号分隔，位于function body的大括号前面，如果没有function body使用分号结束，通常用于给final field赋值，也可以在开发期间用assert语句排除非法输入)  
2. superclass’s no-arg constructor 
3. main class’s no-arg constructor  
NamedConstructor构造函数可以使用:this(params)重定向到本类常规的构造函数。这时候要求不能有function body(比如BlocProvider的构造函数就是如此)  
Factory Constructor，可以使用factory关键词，函数名是类名(所以不能和常规的构造函数共存，通常用于)，这种构造函数，可以在function body使用return语句，通常用于控制返回子类，或者单例等等。工厂构造函数可以在Stream看到很多例子。  
属性：  
所有的field都包含隐式的getter，如果可以的也包含setter，我们可以使用关键词set和get来定义property，语法是：
```
returnType get propertyName {function body}
set propertyName(oneParam){function body}这里强调，set要求只能有一个参数
```
抽象函数：
抽象的函数必须存在于抽象类  
getter和setter也可以是抽象的  
隐式接口：  
所有的类都是一个接口，可以被implement，这种情况下，类定义的所有instance method都要求重写(包含只有getter或者setter的property)  
Extend：Dart支持单继承结构，在重写的情况下，如果要narrow函数的参数或者instance variable，可以使用关键词covariant表示协变  
```
abstract class ClassDemo {
  final String name;
  static int age;

  //配置属性
  String get nameAndAge => "$name $age";

  set nameAndAge(String a) {
    nameAndAge = a;
  }

  //抽象的getter
  String get length;

  //配置抽象函数
  void walk();

  //抽象类可以配置NamedConstructor，但这并不能被调用，因为抽象类不能被初始化
  ClassDemo.nullInstance(String name) : name = name;

  //抽象类可以配置常规的Constructor，但这并不能被调用，因为抽象类不能被初始化
  const ClassDemo(this.name);
}

class ClassDemoImpl implements ClassDemo {
  @override
  String nameAndAge;

  @override
  // TODO: implement length
  String get length => null;

  @override
  // TODO: implement name
  String get name => null;

  @override
  void walk() {
    // TODO: implement walk
  }
}
```

### [枚举](https://dart.dev/guides/language/language-tour#enumerated-types)
special kind of class used to represent a fixed number of constant values.  
不同于java，Dart的枚举无法使用带有参数的构造函数，无法定义method  
枚举不能被继承，不能被mixin，不能被implement
枚举可以用于switch语法，这种情况下，编译器要求你覆盖所有当枚举情况，否则给出警告。

### [Mixin语法](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins)
mixin用于向class添加feature，它提供了介于extend和implements的一种实现  
在之前的dart版本中，用于mixin的class通常声明为abstract的，但是新的dart语法中，应该用mixin来声明专门用于with语法的类  
如果三者实现了同一个method，那么首先当前类的重写具有最高优先级，其次是with的类的优先级，with中最后一个类具有最高优先级，然后是extends的优先级，最后是implements(当然这种情况下比如当前类做重写了)  
在minxin中，对当前类使用is Type语法，返回对是true。这一点和接口类似。  
当我们想要在不共享相同类层次结构的多个类之间共享行为时，或者在超类中实现此类行为没有意义时，Mixins非常有用。比如Flutter中的RenderSliverHelpers  
还可以使用语法：mixin name on classname 来指定可以使用这个mixin的类必须是on后面的类的子类.使用mixin声明的类不能被实例化。  
mixin语法还在发展，后续应该会有增强和完善。   

### [泛型](https://dart.dev/guides/language/language-tour#generics)
Dart支持真泛型，也就是泛型的信息是带入运行时的  
Dart针对泛型的restrict约束，只能使用extends（表示接受特定类型及其子类的类型作为泛型约束），不能使用super  
泛型针对class和instance method，由于泛型在Dart带入运行时，泛型可以直接用于一个变量的所有操作（没有约束的泛型只能使用Object的方法，但是可以使用as来转成对应的类型来操作）
泛型method不可以脱离泛型类，也就是只能在泛型类内定义泛型method,泛型方法。泛型方法不能是static的。  
```
class GenericDemo<T extends num> {
  T printGenericT(T t) {
    print(t.toString());
    return t;
  }
}
```

### [Library and visibility](https://dart.dev/guides/language/language-tour#libraries-and-visibility)
每一个dart app都是一个library，即便不是显著的标明为一个Library
以下划线开头命名的identifiers，只在当前Library可见
 
使用import来引入一个library，  
对于dart的内置库使用'dart:xxx'来引入  
对于外置的库使用：'package:xxx'来引入 
可以给一个库设置前缀，import 'package:xxx' as yyy  
可以部分引入一个库，import 'package:xxx' show xxxy或者hide xxxz  
还可以lazy load一个库，这个属于flutter web的内容，我没深入看。  

对于flutter而言：涉及的包有两种：
1. dart package。这种包里面只有dart的代码
2. flutter plugin，这种包还包含native端的代码
3. 还有一种flutter module用于混合项目的开发，但是这个不适合我们的项目，没怎么看过。
### [异步支持](https://dart.dev/guides/language/language-tour#asynchrony-support)
Dart中，异步函数支持的核心是Future和Stream
[官方介绍异步的章节](https://dart.dev/codelabs/async-await)
其中在结尾的[这篇文章](https://medium.com/dartlang/dart-asynchronous-programming-isolates-and-event-loops-bffc3e296a6a)介绍了Event Loop和Isolate的概念，非常建议看看

Future的获取
1. 通过使用异步函数，也就是function body使用async修饰的函数
2. 也可以使用Future的工厂方法，这个不太常见  

Stream的获取
1. 通过使用Async Generator
2. 通过使用Stream的工厂方法，比如Stream.value
3. 通过StreamController  
更详细的Future和Stream的使用参见本项目的lib文件夹下相关的文件。


### [TypeDef](https://dart.dev/guides/language/language-tour#typedefs)  
Typedefs:定义一个函数别名：定义函数的入参和返回类型。语法是：
```
typedef TypeName = returnType Function(params)
```

### [注释](https://dart.dev/guides/language/language-tour#comments)
- 单行注释
```
// 这是一个单行注释
```
- 多行注释
```
/*
 * 这是一个多行注释
 */
```
- 单行的文档注释
```
/// 这是一个单行的文档注释
```
- 多行的文档注释
```
/**
 * 这是一个多行的文档注释
 */
```

==============================================================================  
**以下内容属于不常用的内容，我提一下给一个研究的灵感。**

### [Metadata](https://dart.dev/guides/language/language-tour#metadata)
Use metadata to give additional information about your code. A metadata annotation begins with the character @, followed by either a reference to a compile-time constant (such as deprecated) or a call to a constant constructor.  
```
//注解的使用
class Television {
  /// _Deprecated: Use [turnOn] instead._
  @deprecated
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {...}
}
```
```
//定义注解，核心是必须是const 构造函数
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
```
Metadata can appear before a library, class, typedef, type parameter, constructor, factory, function, field, parameter, or variable declaration and before an import or export directive. You can retrieve metadata at runtime using reflection.  
根据上面说的，注解的信息可以在运行期反射获得（但这一点在flutter端被禁止了），注解还可以被IDE利用(比如@override)做代码检查。
注解的深入使用，还有利用注解在编译期间生成文件，这个属于比较高级的应用，后续可以自己研究，相关参考的文章可以看[闲鱼的这篇文章](https://www.yuque.com/xytech/flutter/vf1dpf)。

### [Isolates](https://dart.dev/guides/language/language-tour#isolates)
Isolates：意味者隔离。  
在Dart里面，没有线程的概念，取而代之的是Isolate  
Each isolate has its own memory heap, ensuring that no isolate’s state is accessible from any other isolate.  

所以在Dart里面，没有多线程抢占的开销，但是有Isolate间通信的开销  
在面对IO密集场景的时候，建议使用单线程模型。Isolate主要面向计算密集的场景  
关于异步的开销可以看一篇[阿里的公众号文章](https://mp.weixin.qq.com/s?__biz=MzIzOTU0NTQ0MA==&mid=2247491875&idx=1&sn=cb915675f6b1892d22bd434b372910c7&chksm=e92adc2cde5d553aad57ee1cc552744e1a43a5dfaa9a82444c41d557d1b3f7a05dd7b31b39e6&mpshare=1&scene=1&srcid=&sharer_sharetime=1574059736222&sharer_shareid=21d726102aad19c71aba0ca73ae8f9dd&pass_ticket=J8%2FnYKmjTGkQh%2BjCc4hg0LJToeKR1sjVCLaqOfzKzq5zfJmoWMlTORnzfAp80%2B96#rd)  
关于Isolate的使用可以参考[官方DEMO](https://github.com/flutter/samples/tree/master/isolate_example)

我介绍一下Isolate的使用的模版：  
```
SendPort childIsolateSP;

Future<Isolate> createIsolate() async {
  ReceivePort mainIsolateRp = ReceivePort();
  SendPort mainIsolateSp = mainIsolateRp.sendPort;

  mainIsolateRp.listen((Object message) {
    if(message is SendPort) {
      childIsolateSP = message;
    }
    if(message == "你好main，我建立好了") {
      childIsolateSP.send("你好child,那开始庆祝吧");
    }
  });
 return await Isolate.spawn(childIsolateEntryPoint, mainIsolateSp);
}

void childIsolateEntryPoint(SendPort mainIsolateSp)  {
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
```


### Reflection
反射在Flutter中是禁止的，并且在官方目前是实验性质的，官方对应的核心库是mirror库，可以参考[核心库预览](https://api.dart.dev/stable/2.6.1/dart-mirrors/dart-mirrors-library.html)  
反射的语法仍然是不稳定的，并且目前只是针对Dart VM & dart2js,所以感兴趣的私下了解。

- Dart反射的思路和java是一致的，都是对语言进行了某种程度的建模和解析。
- 整个反射的核心建立在各种Mirror类上，属于dart:mirrors库
- 反射的核心是三个方法：分别反射的是instane，Class和Type
```
external InstanceMirror reflect(Object reflectee);
external ClassMirror reflectClass(Type key);
external TypeMirror reflectType(Type key, [List<Type> typeArguments]);
```


- A [TypeMirror] reflects a Dart language class, typedef, function type or type variable.类声明：abstract class TypeMirror implements DeclarationMirror
- A [ClassMirror] reflects a Dart language class.类声明：abstract class ClassMirror implements TypeMirror, ObjectMirror
- An [ObjectMirror] is a common superinterface of [InstanceMirror],[ClassMirror], and [LibraryMirror] that represents their shared functionality.类声明：abstract class ObjectMirror implements Mirror
- An [InstanceMirror] reflects an instance of a Dart language object.  类声明：abstract class InstanceMirror implements ObjectMirror 

下面的代码使用反射获取了InstanceMirror,触发了A的构造函数
```
import 'dart:mirrors';
class A{
  int a;
  A(this.a){
    print(a);
  }
}
main(){
  ClassMirror classMirror = reflectClass(A);   
  classMirror.newInstance(Symbol.empty ,[1]); //调用构造方法，打印1
}
```


- 元数据对象获取：通过ClassMirror对象获取metadata(类型是：List<InstanceMirror>)，然后遍历依次调用reflectee(反思者)
```
import 'dart:mirrors';
@Todo('我', '干活')
class A{
  int a;
  A(this.a){
    print(a);
  }
}

class Todo {
  final String who;
  final String what;
  const Todo(this.who, this.what);
}

main(){
  ClassMirror classMirror = reflectClass(A);
  // 获取 class 上的元数据
  classMirror.metadata.forEach((metadata) {
    print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
  });
}
```

下面的代码把一个类的结构进行了反射打印：
```
import 'dart:mirrors';

typedef F<T, E> = int Function({E b, T a});

class A<T> {
  Map<String,int> a;
  static int b;
  static F<int, String> a2;
}

main(List<String> args) {
  getAnnotation();
}

void getAnnotation() {
  ClassMirror classMirror = reflectClass(A);
  classMirror.declarations.forEach((Symbol key, DeclarationMirror value) {
    //获取属性a和a2的反射
    if (value is VariableMirror) {
      //获取属性的类型
      var type = value.type;
      print("${type.reflectedType} , isStatic = ${value.isStatic}");
      //函数类型反射
      if (type is FunctionTypeMirror) {
        print(type.returnType);
        type.parameters.forEach((value) {
          if (value is ClassMirror) {
            print(value);
          } else if (value is ParameterMirror) {
            print(value.simpleName);
          }
        });
      }
      type.typeVariables.forEach((value) => print("哈哈哈$value"));
      type.typeArguments.forEach((value) => print("嘿嘿嘿$value"));
    }
  });
}
```

下面的代码重点介绍了注解的反射；
```
import 'dart:mirrors';

@Todo('todo1', 'A')
class A{
  @Todo('todo2', 'a')
  int a;
  A(this.a){
    print(a);
  }
  @Todo('todo3', 'doA')
  doA(@Todo('todo4', 'x')int x){}
}

class Todo {
  final String who;
  final String what;
  const Todo(this.who, this.what);
}

main(List<String> args) {
  getAnnotation();
}

void getAnnotation() {
  ClassMirror classMirror = reflectClass(A);

  // 1.获取 class 上的元数据
  classMirror.metadata.forEach((metadata) {
    //因为示例就一个元数据，后续就省略判断了
    if (metadata.reflectee is Todo) {
      print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
    }
  });

  //declarations,获取A类所有的方法和属性（没有继承）
  classMirror.declarations.forEach((Symbol key, DeclarationMirror value) {
    //属性是VariableMirror
    if(value is VariableMirror){
      // 2.属性上的元数据
      value.metadata.forEach((metadata) {
        print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
      });
    }

    if (value is MethodMirror) {
      // 3.方法上的元数据
      value.metadata.forEach((metadata) {
        print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
      });
      // 方法里的参数列表
      value.parameters.forEach((param) {
        //4.方法里参数的元数据
        param.metadata.forEach((metadata) {
          print(metadata.reflectee.who + ' ==> ' + metadata.reflectee.what);
        });
      });
    }
  });
}
```


### 详细的官方资料
这篇文档，是结合官方的[Dart tour](https://dart.dev/guides/language/language-tour)进行了补充，更专业的资料请查看[Dart language specification](https://dart.dev/guides/language/spec),和[Effective Dart](https://dart.dev/guides/language/effective-dart)

另外这里有[flutter官方github](https://github.com/flutter),可以看到很多官方的团队的风格。





















