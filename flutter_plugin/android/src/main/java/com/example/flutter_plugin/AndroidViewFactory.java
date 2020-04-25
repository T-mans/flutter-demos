package com.example.flutter_plugin;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class AndroidViewFactory extends PlatformViewFactory {

    private Registrar _registrar;
    private BinaryMessenger _binaryMessenger;

    public AndroidViewFactory(Registrar registrar, BinaryMessenger binaryMessenger) {
        super(StandardMessageCodec.INSTANCE);
        this._registrar = registrar;
        this._binaryMessenger = binaryMessenger;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new AndroidViewDemo(i,_binaryMessenger, _registrar,o);
    }
}
