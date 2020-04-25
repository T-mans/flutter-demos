package com.example.flutter_plugin;

import android.content.Context;
import android.os.BatteryManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterPlugin
 */
public class FlutterPlugin implements MethodCallHandler {

    static Registrar registrarInstance;

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), Constant.PLUGIN_BASIC_METHOD);
        channel.setMethodCallHandler(new FlutterPlugin());

        registrar.platformViewRegistry().registerViewFactory(Constant.PLUGIN_PLAT_FORM_BASIC_VIEW_NAME, new AndroidViewFactory(registrar, registrar.messenger()));
        registrarInstance = registrar;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("getBatteryLevel")) {
            result.success(((BatteryManager) registrarInstance.activity().getSystemService(Context.BATTERY_SERVICE)).getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY));
        } else {
            result.notImplemented();
        }
    }
}
