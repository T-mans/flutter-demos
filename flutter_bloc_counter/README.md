# flutter_bloc_counter

An app showing the usage and principle of bloc

## 使用

- 定义自己的bloc，继承于bloc，重写initialState属性和mapEventToState方法
- 使用BlocProvider作为最外层的widget，构造函数传入T Function(BuildContext context)和child
- 在child的页面：使用BlocProvider.of<T>(context)的class方法来获取Bloc
- 在child的页面：使用BlocBuilder，构造函数传入Widget Function(BuildContext context, S state)来根据state构建widget

## 框架架构
flutter_bloc框架主要由三个框架构成：flutter_bloc，bloc，provider，其中bloc和provider是两个独立的框架，而flutter_bloc依赖后两者
1. provider框架的核心能力有两个：
    1. 提供在subtree中获取value的能力
    2. 提供value的dispose接口
2. bloc是business logic component的缩写，bloc本身继承于stream，并且持有两个stream(一个event，一个state)。bloc在dart里面实现了[Bloc pattern](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/)
3. flutter_bloc依赖上述两个框架的能力，使得在全局寻找bloc，管理bloc的流的生命周期，并使用bloc来分离并联系UI和逻辑层成为可能。

## bloc参与软件分层图示
![基于business logic component的软件fen层](https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png)
## bloc在flutter的图示
![Bloc在flutter的图解](https://www.didierboelens.com/images/streams_bloc.png)

## [Provider框架](https://pub.flutter-io.cn/packages/provider)
#### A mixture between dependency injection (DI) and state management, built with widgets for widgets.
因为我们的重点是flutter_bloc框架，我们着重介绍flutter_bloc依赖的**ValueDelegateWidget**类
- **ValueDelegateWidget**:
    这个类核心就是把相关的操作代理改了StateDelegate类，这个抽象类实现了initDelegate，didUpdateDelegate，dispose的空实现，子类有不同的实现，
    其中对于通过默认构造函数构建的BlocProvider是使用了BuilderStateDelegate，在它的disposer里面对持有的bloc进行了close操作
- 另外BlocProvider的of(context)方法，其实是调用了Provider类的of(context,listen:false)方法。从而提取到最近的Provider<T>并获取内置的value T。在BlocProvider泛型就是bloc及其子类。

## [bloc框架](https://pub.flutter-io.cn/packages/bloc)
#### A dart package that helps implement the BLoC pattern.
- **BlocSupervisor**  
    一个持有BlocDelegate的单例
- **BlocDelegate**  
    一个持有onEvent，onTransition,onError三个方法的类，用于所有bloc的hook操作
- **Bloc**  
    Bloc继承于Stream并实现了Sink接口，或者提供了add(添加事件)和close(关闭管理event的PublishSubject和管理state的BehaviorSubject)方法
    Bloc是一个抽象类，暴露了两个接口，一个是initialState属性，另外一个是mapEventToState方法，该方法返回一个Stream<state>的流
    默认构造函数，实现了基于initialState的赋值 _stateSubject = BehaviorSubject<State>.seeded(initialState);
    默认构造函数，实现了基于mapEventToState方法返回的流的forEach监听，当流里面有不同的event出现，并且_stateSubject尚未close，则会把state向_stateSubject发送

## [flutter_bloc框架](https://pub.flutter-io.cn/packages/flutter_bloc)
#### A Flutter package that helps implement the BLoC pattern.因为除此之外还有针对angular的实现
关于flutter_bloc框架的类解读
- **BlocBuilder类:**  
    这个类继承于BlocBuilderBase,而后者又直接继承自StatefulWidget。BlocBuilder只有一个const的构造函数，强制要求的传参是builder，这是一个函数类型，函数签名是：（context，state）=》Widget。这个只是用于widget的build方法返回一个widget。
  	BlocBuilder的构造函数里有一个bloc参数，如果这个参数不传递，则BlocBuilder会使用BlocProvider和当前的BuildContext自动执行查找。尽量不要在BlocBuilder内使用bloc参数，除非你确定你只想要一个当前类内的局部bloc，而不是可以通过父BlocProvider或者当前BuildContext可以访问的bloc。
  	BlocBuildeør有一个condition参数：这个参数的签名是：（previousState, currentState) => bool,用于控制是否调用builder进行Widget重建（PS：我暂时没想到这个的用处，如果是用于去重或者debounce之类的话，似乎在自定义的bloc里面更合适）
  	BlocBuilder源于StatefulWidget，在对应的State类initState方法里面对bloc进行了订阅，在对应的dispose方法进行了取消订阅
- **BlocListener类:** 
    BlocListener继承于BlocListenerBase继承于StatefulWidget，用于当state变化的时候，调用BlocWidgetListener(签名：（context，state) =》 void）进行一个操作，通常该操作应该是适用于当state每次改变后调用一次的，比如navigation，showing a snackBar，showing a dialog等等。
  	类似BlocBuilder，如果构造函数的bloc参数被省略的话，会从BlocProvider或者当前BuildContext查找bloc。所以类似于BlocBuilder，一般不应该传递bloc参数。
  	同样类似于BlocBuilder，BlocListener的构造函数可以传递一个condition参数，基于previousState和currentState决定是否调用BlocWidgetListener。
- **BlocProvider类:**  
    BlocProvider继承于ValueDelegateWidget（在Provider框架内）继承于DelegateWidget(也在Provider框架内)继承于StatefulWidget.
  	BlocProvider用于给自己的children提供bloc，子children使用BlocProvider.of<T>(context)来获取bloc，这样Widget的subtree获取的bloc是同一个instance。
  	BlocProvide有两个公开的构造函数，分别是BlocProvider(ValueBuilder<T> builder,Widget T)和BlocProvider.value(T value,Widget child).
  	BlocProvider的类泛型是Bloc<dynamic, dynamic>的子类，所以ValueBuilder<T>的签名是（context） => T。前者构造函数和后者NamedConstructor的区别是前者会对Bloc进行自动的close（因为这个通常这里的bloc是new出来的，不应该使用现有的bloc，不然会被注销掉，从而使得bloc原来绑定的页面无法刷新），但是后者是不注销bloc的。利用这一点，可以在相邻的两个页面使用同一个bloc进行页面的管理。
  	blocProvider复写了build方法,这个build方法在对应的State类内build方法会调用，返回的是一个InheritedWidget的子类。这个类是共享bloc的关键。(因为framework层有hashMap存储，这里查找对应类的时间开销是O1)
  	State对应的dispose方法会触发BlocProvider的Delegate的dispose方法，这里对于新创建的会调用bloc?.close,对于通过value构造函数创建的BlocProvider这个实现是empty的所以doNothing。
- **MultiBlocListener类:**  
    类似于BlocProvider，flutter_bloc框架提供了MultiBlocListener，来解决BlocListener嵌套的问题。
  	MultiBlocListener继承于StatelessWidget，同样只包含了List<BlocListener>和Widget child两个属性，构造函数也只是向这两个属性赋值。
  	BlocListener的泛型和BlocBuilder一样，是<bloc, state>
- **MultiBlocProvider类:**
    如果涉及向一个route注入多个BlocProvider，可以使用BlocProvider嵌套的写法，但是flutter_bloc提供了更加简洁的封装：MultiBlocProvider。
  	MultiBlocProvider直接继承于StateLessWidget，构造函数只有一个：MultiBlocProvider(List<BlocProvider> providers,Widget child),这也是该类的两个field，
  	这个类是一个StatelessWidget,在build(context)复写方法里面使用provider.cloneWithChild进行了blocProvider嵌套的组装。
- **MultiRepositoryProvider类:**  
    类似于MultiBlocProvider，我们可以使用MultiRepositoryProvider来避免嵌套式的声明。同样MultiRepositoryProvider只有两个属性，分别是：List<RepositoryProvider> providers和Widget child。
- **RepositoryProvider类:**  
    RepositoryProvider不同于BlocProvider的继承关系在于，RepositoryProvider直接继承于Provider(Provider框架)，而Provider才和BlocProvider一样继承于ValueDelegateWidget。
	RepositoryProvider不同于BlocProvider的泛型关系在于，前者的泛型是T，没有任何约束，后者的泛型是<T extends Bloc<dynamic, dynamic>>,
	RepositoryProvider用于向subtree提供一个repository，children使用RepositoryProvider.of<T>(context)来获取同一个repository的instance。
	类似于BlocProvider的API，RepositoryProvider同样提供了.value构造函数来构造，这里要求泛型T应该使用现有的，而不是new出来的。
	从源码层面来看，RepositoryProvider只是在Provider的基础上增加了static T of<T>(context)方法，该方法其实也是调用了Provider的static T of<T>（context，listen:false）方法，所以可以视为对Provider的简单包装。  

## 下面不做类解析，直接说明几个核心的问题：
### bloc类的event怎么和state关系上的
bloc作为一个抽象函数，暴露出来的重要接口就是Stream<State> mapEventToState(Event event),这个接口由开发者实现，可以根据event转换为对应的state

### bloc中管理State的Stream何时订阅的，何时取消订阅的
- 订阅：这个在BlocBuilder类的State类里面，在initState方法内部调用了_subscribe私有方法，里面调用了bloc的listen方法，而这个方法其实就是stateStream流的订阅。  
注意_subscribe这里有一个细节，_bloc.skip(1).listen在订阅前调用了一次skip。这是因为bloc.value在初次构建的时候使用的是内置wrapper的数据，但是如果订阅之后不做一次skip，这个里的BehaviorSubject会再次给订阅者发送这次数据，造成重复。
而且这里使用BehaviorSubject支持value属性，没有使用PublishSubject因为这个类不支持保存最近的value。这个问题其实是RxDart引起的。
- 取消订阅：这个在BlocBuilder类的State类里面，在dispose方法内部调用了_unsubscribe私有方法，里面执行了流的取消订阅
### bloc作为Stream何时被关闭
这个在BlocProvider类的父类DelegateWidget的State类里面，里面调用了代理类StateDelegate类的dispose方法，这个StateDelegate在BlocProvider里面，
由于BlocProvider创建方式不同而不同，如果是普通的new出来的，会使用BuilderStateDelegate子类，这个子类调用了bloc.close来关闭了内部的两个Stream。
如果使用BlocProvider的value构造方法，这个地方的默认实现是空的，也就是不关闭bloc，所以可以用于多个页面共享同一个bloc

### 为什么不单独使用bloc框架
bloc框架本身只是提供了两个基于RxDart的Stream，以及Stream的订阅和bloc的close接口，它无法解决在flutter超多的widget嵌套中获取bloc本身的能力，这一点其实是Provider框架的能力。

### 为什么不单独使用provider框架
首先Provider类，在静态方法debugCheckInvalidValueType并不允许value是Listenable或者Stream
那么支持Stream的StreamProvider类，需要直接管理一个stream(这显然太复杂了)，这无法实现我们event和state的转换管理在一个框架的诉求(这其实就是bloc做的事情),

### 为什么采用了flutter_bloc
简单而说:flutter_bloc帮我们减少了模版代码的开销。
flutter_bloc框架的核心类BlocProvider类和Provider类一样都继承于ValueDelegateWidget类，从这个类的State代理给了StateDelegate，核心的暴露就是initDelegate和dispose接口，
前者完成了bloc的构建，后者完成了bloc的close。

### 为什么```BlocProvider.of<T extends Bloc>(BuildContext context)```可以获取T extends Bloc
首先说明一点：这个函数的调用的时间开销是O(1)的，因为在framework层查找是在一个HashMap里面进行的，所以不用担心性能问题。  

源码层面：首先BlocProvider的build方法返回了一个InheritedProvider。  
InheritedProvider继承了InheritedWidget.这个类有一个核心的重写方法叫createElement返回了InheritedElement。  
InheritedElement的核心复写的方法叫_updateInheritance，这里面执行了```_inheritedWidgets[widget.runtimeType] = this;```刷新了map  
然后在BlocProvider.of方法里面，这个根据type从这个map里面取得了数据。

这里注意使用这个方法的时候要指定泛型，否则你可能获得这个运行时错误：BlocProvider.of() called with a context that does not contain a Bloc of type Bloc<dynamic, dynamic>.