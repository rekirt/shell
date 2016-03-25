package com.iss.drc.view.calenderview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-25
 */
public class LargeImageVIew extends View {

    private BitmapRegionDecoder mDecoder;
    private static final BitmapFactory.Options options = new BitmapFactory.Options();
    private int mImageWidth;
    private int mImageHeight;
    private volatile Rect mRect = new Rect();

    private MYMoveGestureDetector mDetector;

    static {
        options.inPreferredConfig = Bitmap.Config.RGB_565;
    }

    public LargeImageVIew(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        mDetector = new MYMoveGestureDetector(getContext(),new MYMoveGestureDetector.SimpleMoveGestureDetector(){
            @Override
            public boolean onMove(MYMoveGestureDetector detector) {
                int moveX = (int)detector.getMoveX();
                int moveY = (int)detector.getMoveY();
                if(mImageWidth>getWidth()){
                    mRect.offset(-moveX,0);
                    checkWidth();
                    invalidate();
                }
                if(mImageHeight>getHeight()){
                    mRect.offset(0,-moveY);
                    checkHeight();
                    invalidate();
                }
                return true;
            }
        });
    }
    //显示的真是高度
    private void checkHeight() {
        Rect rect = mRect;
        int imageWidth = mImageWidth;
        int imageHeight = mImageHeight;

        if(rect.bottom>imageHeight){
            rect.bottom = imageHeight;
            rect.top = imageHeight-getHeight();
        }

        if(rect.top<0){
            rect.top = 0;
            rect.bottom = getHeight();
        }
    }

    //获取显示的真是宽度
    private void checkWidth() {
        Rect rect = mRect;
        int imageWidth = mImageWidth;
        int imageHeight = mImageHeight;
        if(rect.right > imageWidth){
            rect.right = imageWidth;
            rect.left = imageWidth-getWidth();
        }
        if(rect.left<0){
            rect.left = 0;
            rect.right = getWidth();
        }
    }


    @Override
    public boolean onTouchEvent(MotionEvent event) {
        mDetector.onTouchEvent(event);
        return true;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int width = getMeasuredWidth();
        int height = getMeasuredHeight();

        int imageWidth = mImageWidth;
        int imageHeight = mImageHeight;
        //中心设置为图片中心
        mRect.left = imageHeight/2 - width/2;
        mRect.top = imageHeight/2 - height/2;
        mRect.right = mRect.left+width;
        mRect.bottom = mRect.top + height;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if(null!=mDecoder){
            Bitmap bm = mDecoder.decodeRegion(mRect,options);
            canvas.drawBitmap(bm,0,0,null);
        }
    }


    public void setImagePath(String path){
        try {
            mDecoder = BitmapRegionDecoder.newInstance(path,false);
            BitmapFactory.Options ops = new BitmapFactory.Options();
            ops.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(path,ops);
            mImageWidth = ops.outWidth;
            mImageHeight = ops.outHeight;
            requestLayout();
            invalidate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

















}
