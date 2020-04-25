import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SingleChildLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //注意Align是Column的直接子view，而column默认交叉轴对其是居中的
            //heightFactor和widthFactor决定了Align相对与child的大小，因为值可以小于1，所以child并不要求在Align的范围内
            //这个会首先把Align放在中间，然后Align的alignment属性决定了Align空间和child空间的那个角对齐
            Align(
              alignment: Alignment.topRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: 50,
                color: Colors.green,
              ),
            ),
            //Container没有child的话会尽量大，除非外部的约束是无限大（则container尽量小）
            //带有child赋值的container会根据child来决定自己的size
            //如果复写了width，height或者BoxConstraints，相应的约束被重写（比如只设定height，则height被重写，但是width还是通过child来计算）
            Container(
              color: Colors.red,
              height: 30,
              //AspectRation首先尝试width尽量大，height会根据width和ratio来计算
              //如果计算的height超过了外层约束，那么会取边界值反向计算width，直到宽高都符合外层约束
              //如果一直无法满足外层约束，会放弃aspectRation，而是根据child的size来选取宽高值，比如下面这个demo
              //在这个demo里面，高度30计算出来的宽度显然是60，
              //当然这个demo我在加一个width约束，因为根据width约束，height是15，这不符合30的约束
              //反过来，根据height计算的宽度是60，这不符合container的height必须是30的约束
              //所以这里AspectRatio约束失效，使用child的size，
              width:30,
              child: AspectRatio(
                aspectRatio: 18/9,
                child:Container(color: Colors.yellow,
                child: Text("Your Sister",style: TextStyle(fontSize: 16),),),
              ),
            ),
            //这个例子就展示了，当container的width，height，BoxConstraints都没有，指定第二顺位优先级，根据child来决定大小
            Container(
              color: Colors.red,
              child: Text("Hello World! Hello World",style: TextStyle(fontSize: 16),),
            ),
            //BaseLine中的baseline指定child的baseline距离box的顶部距离，
            //如果这个值还没有child的top和child的baseline的距离大，那么child的baseline就是顶部对齐
            //如果没有baseline，使用child的bottom作为基准
            //
            Baseline(
                baseline: 0,
                // 对齐的对象类型
                baselineType: TextBaseline.alphabetic,
                child: Text('hello🤮😄😂你好 ',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                )
            ),
            Baseline(
                baseline: 100,
                baselineType: TextBaseline.ideographic,
                child: Text('hello🤮😄😂你好 ',
                  style: TextStyle(fontSize: 40),
                )
            ),
            //测试汉字的baseline问题，使用alphabetic
            Baseline(
                baseline: 100,
                baselineType: TextBaseline.alphabetic,
                child: Text('你好，啊',
                  style: TextStyle(fontSize: 40),
                )
            ),
            //对比英文的baseline问题，使用alphabetic
            Baseline(
                baseline: 100,
                baselineType: TextBaseline.alphabetic,
                child: Text('Helloqgjpy',
                  style: TextStyle(fontSize: 40),
                )
            ),
            //测试汉字的baseline问题，使用ideographic
            //https://blog.csdn.net/hanyingjie327/article/details/22799811
            //以上文章指出，汉字在方框中，没有baseline
            Baseline(
                baseline: 100,
                baselineType: TextBaseline.ideographic,
                child: Text('你好，啊',
                  style: TextStyle(fontSize: 40),
                )
            ),
            //如果不配置factor，那么如果维度上有约束，则Center尽可能大，维度上没有约束，使用child的维度
            //如果配置了factor，那么根据child的尺寸来生成Center的尺寸
            Center(
              widthFactor: 2,
              child: Text("center text\ncenter text",style: TextStyle(fontSize: 16),),
            ),
            //ConstrainedBox给了一个强制的最小，最大宽高约束，child的size必须处于这个约束之中
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 20,maxHeight: 40,minWidth: 100,maxWidth: 200),
              child: Text("center textcenter text",style: TextStyle(fontSize: 20),),
            ),
            //这个类用途我觉得类似于WebView高度自适应的时候，这个类开销昂贵O(n2),尽量不用
            IntrinsicHeight(
              child: Text("IntrinsicHeight"),
            ),
            //LimitedBox只有特定方向没有约束的话，max才生效，比如下面的maxWidth没有效果
            LimitedBox(
              maxHeight: 100,
              maxWidth: 100,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            //Offstage用来看起来有这些child，但是不绘制任何东西，这个有啥卵用呢？😂
            Offstage(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              //这个OverflowBox直接用在滚动的列表里面似乎不行，嵌套一个SizedBox可以
              //这个可以阻绝自己parent和child之间的约束关系，
              //比如：maxWidth: double.infinity,让内部的text突破了外层SizedBox的宽度限制
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: 100,
                child: Text("OverflowBoxOverflowBox",),
              ),
            ),
            //固定宽高的,width和height一定要传，而且不能为null
            SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              //这个OverflowBox直接用在滚动的列表里面似乎不行，嵌套一个SizedBox可以
              //这个可以阻绝自己parent和child之间的约束关系，
              child: Text("OverflowBoxOverflowBox"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            //这个不同于OverflowBox的地方，需要指定size，但是这个size对自己有约束，对child没有约束
            //好吧，我还是不明白有啥用啊😂
            SizedOverflowBox(
              size: Size(100,30),
              child: Container(
                width: 400,
                height: 60,
                color: Colors.red,
              ),
            ),
            Transform(
              alignment: Alignment.topRight,
              origin: Offset(30,30),
              transform: Matrix4.skewY(0)..rotateZ(0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xFFE8581C),
                child: const Text('Apartment for rent!'),
              ),
            ),
            //这个还是不太懂啊
            FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.topRight,
              child: Container(
                width: 800,
                height: 20,
                color: Colors.red,
              ),
            ),
//            //这个应该不允许放在滚动里面，
//            //these invalid constraints were provided to RenderConstrainedBox's
//            FractionallySizedBox(
//              widthFactor: 2,
//              heightFactor: 2,
//              child: Container(
//                color: Colors.greenAccent,
//                width: 500,
//                height: 300,
//              ),
//            )
            //这个不能放在可滚动的column里面，因为是用并且只能用在column，row，flex里面用来占领㊗主轴剩余空间的
            //flex用于同一个column，row或者flex里面多个expanded时候，按比例均分剩余空间的意思
//            Expanded(
//              flex: 1,
//              child: Text("你好"),
//            ),
          ],
        ),
      ),
    );
  }
}