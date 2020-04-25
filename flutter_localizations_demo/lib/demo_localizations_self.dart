//Locale资源类
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
//这里我们定义的只支持中文，否则使用英文
//当然这个demo的问题是每一个语言，都要我们开发人员用if else来配置，如果有几十种语言，对于程序员很不友好，对于不懂编程的运营人员显更不友好

class DemoLocalizations {
  DemoLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;
  //为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }
  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }

//... 其它的值
}

//Locale代理类
class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("xxxx$locale");
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == "zh")
    );
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}