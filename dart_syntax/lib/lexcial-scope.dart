//这里展示了词汇作用范围，在当前位置还有内部嵌套的大括号，都是可以被访问的.
//内层可以访问外层的，外层无法访问内层的。

void main() {
  var insideMain = true;
  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

bool topLevel = true;
