package com.iss.drc.activity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageView;

import com.iss.drc.R;
import com.iss.drc.indoormap.Logger;
import com.iss.drc.view.calenderview.LargeImageVIew;

import java.io.IOException;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-25
 */
public class TestActivity extends Activity {


    @Nullable
    @Override
    public View onCreateView(String name, Context context, AttributeSet attrs) {
        Logger.e("onCreateView");
        return super.onCreateView(name, context, attrs);

    }

    ImageView iv_shit;
    LargeImageVIew iv_god;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_test);
        Logger.e("onCreate");
        iv_shit = (ImageView) findViewById(R.id.iv_shit);
        iv_god = (LargeImageVIew)findViewById(R.id.iv_god);



        iv_god.setImagePath("/sdcard/image.jpg");

    }



    public void loadshit(View v){

        //1
        //直接将一个res中的一张大图片设置到ImageView
        //Bitmap too large to be uploaded into a texture (4160x3120, max=4096x4096)

        //2
        //Bitmap bm = BitmapFactory.decodeFile("/sdcard/image.jpg");
        //iv_shit.setImageBitmap(bm);


        //3
//        BitmapFactory.Options options = new BitmapFactory.Options();
//        //只读取图片信息
//        options.inJustDecodeBounds = true;
//        BitmapFactory.decodeFile("/sdcard/image.jpg",options);
//        //获取图片的实际宽高
//        int realWidth = options.outWidth;
//        int realHeight = options.outHeight;
//        Logger.e("图片实际宽高==w"+realWidth+"==h=="+realHeight);
//
//        //获取屏幕宽高
//        WindowManager wm = (WindowManager) getSystemService(WINDOW_SERVICE);
//        int screenWidth = wm.getDefaultDisplay().getWidth();
//        int screenHeight = wm.getDefaultDisplay().getHeight();
//
//        //计算宽高缩放比
//        int scaleX = realWidth/screenWidth;
//        int scaleY = realHeight/screenHeight;
//        int scale = 1;
//
//        if(scaleX>scaleY && scaleY>=1){
//            scale = scaleX;
//        }
//
//        if(scaleX<scaleY && scaleX>=1){
//            scale = scaleY;
//        }
//
//        options.inJustDecodeBounds = false;
//        options.inSampleSize = scale;
//        Logger.e("缩放比例==="+scale);
//        Bitmap bm = BitmapFactory.decodeFile("/sdcard/image.jpg",options);
//        iv_shit.setImageBitmap(bm);


        //
        area();

    }

    private void area() {

//        try {
//
//            BitmapFactory.Options options = new BitmapFactory.Options();
//            //只读取图片信息
//            options.inJustDecodeBounds = true;
//            BitmapFactory.decodeFile("/sdcard/image.jpg",options);
//            //获取图片的实际宽高
//            int realWidth = options.outWidth;
//            int realHeight = options.outHeight;
//
//            BitmapRegionDecoder decoder = BitmapRegionDecoder.newInstance("/sdcard/image.jpg",false);
//            options = new BitmapFactory.Options();
//            options.inPreferredConfig = Bitmap.Config.RGB_565;
//            Bitmap bm = decoder.decodeRegion(new Rect(realWidth / 2 - 100, realHeight / 2 - 100, realWidth / 2 + 100, realHeight / 2 + 100), options);
//            iv_shit.setImageBitmap(bm);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }


    }


    @Override
    protected void onStart() {
        super.onStart();
        Logger.e("onStart");
    }


    @Override
    protected void onRestart() {
        super.onRestart();
        Logger.e("onRestart");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Logger.e("onResume");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Logger.e("onPause");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Logger.e("onDestroy");
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Logger.e("onNewIntent");
    }

}
