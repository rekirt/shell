package com.example.bigrongchatdemo;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-27.
 */
public class CircleLayout extends ViewGroup {

    private float radius = 300;//半径大小
    private int mDegress ;//度数
    private int offset = 0;//偏移量

    private Map<Integer,ImageView> mChildViews;
    private List<String> data;

    public CircleLayout(Context context) {
        super(context);
        init();
    }

    public CircleLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public CircleLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        mChildViews = new HashMap<Integer,ImageView>();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int pwidth = getWidth();
        int pheight = getHeight();
        Log.e("test", "测量父控件宽高===pw" + pwidth + "===ph" + pheight);
//        measureChildren(0, 0);
//        Log.e("test", "测量子控件宽高");

        /**
         * 获得此ViewGroup上级容器为其推荐的宽和高，以及计算模式
         */
        int sizeWidth = MeasureSpec.getSize(widthMeasureSpec);
        int sizeHeight = MeasureSpec.getSize(heightMeasureSpec);

        // 计算出所有的childView的宽和高
        measureChildren(widthMeasureSpec, heightMeasureSpec);
        setMeasuredDimension(sizeWidth, sizeHeight);

    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        //获取子view个数
        final int count = getChildCount();
        //计算各个子view之间的角度差
        mDegress = 360/(count-1);
        final int parentLeft = getPaddingLeft();
        final int parentRight = right - left - getPaddingRight();

        final int parentTop = getPaddingTop();
        final int parentBottom = bottom - top - getPaddingBottom();

        if (count < 1 ) {
            return;
        }
        Log.e("test", "degree=" + Math.cos(0 * Math.PI / 180));
        for (int i = 0; i < count; i++) {
            final View child = getChildAt(i);
            if (child.getVisibility() != GONE) {
                int width = child.getMeasuredWidth();
                int height = child.getMeasuredHeight();
                int childLeft;
                int childTop;
                if (i == 0) {
                    childLeft = parentLeft + (parentRight - parentLeft - width) / 2;
                    childTop = parentTop + (parentBottom - parentTop - height) / 2 ;
                    child.layout(childLeft, childTop,childLeft+width,childTop+height);
                }else{
                    childLeft = (int) (parentLeft + (parentRight - parentLeft-width) / 2-(radius * Math.sin((i*mDegress+offset)*Math.PI/180)));
                    childTop = (int) (parentTop + (parentBottom - parentTop-height) / 2-(radius * Math.cos((i*mDegress+offset)*Math.PI/180))) ;
                    child.layout(childLeft, childTop,childLeft+width,childTop+height);

                }

            }
        }
    }

    int baseRadius = 80;

    public void setData(List<String> data) {
        this.data = data;
        if(null==data) return;
        if(null!=data && data.size()<0)return;
        int size = data.size();
        Random random = new Random();
        for (int i =0;i<size-1;i++){
            ImageView iv = new ImageView(getContext());
            int inc = random.nextInt(100);
            LayoutParams params = new LayoutParams(baseRadius+inc,baseRadius+inc);
            iv.setLayoutParams(params);
            iv.setImageResource(R.mipmap.ic_launcher);
            iv.setTag(i);
            mChildViews.put(i, iv);
            addView(iv,i,params);
        }
        Log.e("test","添加完所有控件");
        postInvalidate();
    }
}
