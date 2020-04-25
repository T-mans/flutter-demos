package com.example.flutter_plugin;

import android.content.Context;
import android.content.res.AssetManager;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import org.json.JSONObject;

import io.flutter.embedding.engine.FlutterJNI;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.editing.TextInputPlugin;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewsController;

public class AndroidViewDemo implements PlatformView, MethodCallHandler {

    private BinaryMessenger  binaryMessenger;
    private View view = null;
    private TextView receiveText = null;
    private TextView sendText = null;
    private TextView recieveButton = null;
    private TextView sendButton = null;
    private MethodChannel methodChannel;
    private  Registrar registrar;
    private TextInputPlugin textInputPlugin;

    public AndroidViewDemo(int viewId,
                       BinaryMessenger messenger,
                       Registrar registrar,
                       Object o) {
        this.binaryMessenger = messenger;
        this.methodChannel = new MethodChannel(binaryMessenger, Constant.PLUGIN_PLAT_FORM_BASIC_VIEW_NAME + "_" + viewId);
        this.methodChannel.setMethodCallHandler(this);

        this.registrar = registrar;
        setupViews(registrar);
    }

    @Override
    public void onInputConnectionLocked() {
        Log.e("tags", "onInputConnectionLocked");
    }

    @Override
    public void onInputConnectionUnlocked() {
        Log.e("tags", "onInputConnectionUnlocked");

    }

    private void setupViews(final Registrar registrar) {
        view = (View) LayoutInflater.from(registrar.activity()).inflate(R.layout.android_view, ((ViewGroup) registrar.activity().getWindow().getDecorView()),false);
        sendText = view.findViewById(R.id.sendEditText);

        sendButton = view.findViewById(R.id.sendButton);
        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.e("tags", "执行了");
                methodChannel.invokeMethod("flutterToEvalute", sendText.getText());
            }
        });

        receiveText = view.findViewById(R.id.recieveEditText);
        recieveButton = view.findViewById(R.id.receiveButton);
        recieveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        if (methodCall.method.equals("nativeToEvalute")) {
            if(methodCall.arguments instanceof String) {
                String text = (String)methodCall.arguments;
                receiveText.setText(text);
            } else if (methodCall.arguments instanceof JSONObject) {
                JSONObject json = (JSONObject)methodCall.arguments;
                receiveText.setText(json.toString());
            }
        } else {
            result.notImplemented();
        }

    }

    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {
        methodChannel.setMethodCallHandler(null);
    }


}

//TextField edit event monitor
/**
 * //        sendText.addTextChangedListener(new TextWatcher() {
 * //            @Override
 * //            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
 * //
 * //            }
 * //
 * //            @Override
 * //            public void onTextChanged(CharSequence s, int start, int before, int count) {
 * //
 * //            }
 * //
 * //            @Override
 * //            public void afterTextChanged(Editable s) {
 * //                // methodChannel.invokeMethod("flutterToEvalute", textView.getText());
 * //            }
 * //        });
 * */
//JSON Convert
//  try {
//          JSONObject text1 = new JSONObject("test");
//          System.out.println(text1);
//          } catch (JSONException e) {
//          System.out.println(e.toString());
//          }