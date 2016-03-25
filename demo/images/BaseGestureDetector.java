package com.iss.drc.view.calenderview;

import android.content.Context;
import android.view.MotionEvent;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-25
 */
public abstract class BaseGestureDetector {

    protected boolean mGestureInProgress;
    protected MotionEvent mPreMotionEvent;
    protected MotionEvent mCurrentMotionEvent;
    protected Context mContext;

    public BaseGestureDetector(Context mContext) {
        this.mContext = mContext;
    }

    public boolean onTouchEvent(MotionEvent event){
        if(!mGestureInProgress){
            handleStartProgressEvent(event);
        }else{
            handleInProgressEvent(event);
        }
        return true;
    }

    protected abstract void handleStartProgressEvent(MotionEvent event);

    protected abstract void handleInProgressEvent(MotionEvent event);

    protected abstract void updateStateByEvent(MotionEvent event);

    protected void resetState(){
        if(null!=mPreMotionEvent){
            mPreMotionEvent.recycle();
            mPreMotionEvent = null;
        }
        if(null!=mCurrentMotionEvent){
            mCurrentMotionEvent.recycle();
            mCurrentMotionEvent = null;
        }
        mGestureInProgress = false;
    }















}
