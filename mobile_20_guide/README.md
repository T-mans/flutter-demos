# Run mobile 2.0 step by step

- 从[mobile20](https://code.connected.bmw/mobile20/mobile-connected)clone项目
- 运行```dart ./scripts/cli/cli.dart getPackages```拉取所有的包的依赖
- 运行```./scripts/pipeline/load_keys_from_vault.sh```来Load Keys from Vault
    * for mac：如果发现```consul-template: command not found```，下载[consul-template_0.23.0_darwin_amd64.zip](https://releases.hashicorp.com/consul-template/0.23.0/),解压缩后，放入/usr/local/bin,重启terminal重新执行命令。相关介绍：[Consul-Template简介](https://www.hi-linux.com/posts/36431.html)
    * 继续运行脚本，会去拉取相关的value，也就是基于tpl文件生成对应的文件，我们访问不了目前脚本配置的接口，对于有关的value要手动配置.
- 接下来可以运行项目
    * 使用AndroidStudio运行安卓这边需要使用``` Edit Configurations-左上角+号下拉菜单选flutter-弹出框填写name，Dart Entrypoint，BuildFlavor ```,其中的BuildFlavor使用android/app/build.gradle的productFlavors中配置的名字，比如：bmwkoreaintegration，name自己起，看明白就好。Dart EntryPoint使用lib/main/main_region_envirment.dart
    * 也可以使用flutter命令行取得和配置start configurations一样的效果，比如：``` flutter build apk --flavor bmwchinaintegration --target=/Users/qxy9763/AndroidStudioProjects/mobile-connected-fork/lib/main/main_bmw_china_integration.dart --profile```
    * 也可以使用global配置的命令行来运行Android，比如：```dart ./scripts/cli/cli.dart run --brand BMW —region China --environment Production```

    
