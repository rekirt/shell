package com.iss.drc.view.calenderview;

import android.content.Context;
import android.graphics.PointF;
import android.view.MotionEvent;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-25
 */
public class MYMoveGestureDetector extends BaseGestureDetector {

    private PointF mCurrentPointer;
    private PointF mPrePointer;
    private PointF mDeltaPointer = new PointF();
    private PointF mExtenalPointer = new PointF();
    private OnMoveGestureListener mListener;

    public MYMoveGestureDetector(Context mContext,OnMoveGestureListener listener) {
        super(mContext);
        mListener = listener;
    }

    @Override
    protected void handleStartProgressEvent(MotionEvent event) {
        int action = event.getAction() & MotionEvent.ACTION_MASK;
        switch (action){
            case MotionEvent.ACTION_DOWN:
                resetState();
                mPreMotionEvent = MotionEvent.obtain(event);
                updateStateByEvent(event);
                break;
            case MotionEvent.ACTION_MOVE:
                mGestureInProgress = mListener.onMoveBegin(this);
                break;
        }
    }

    @Override
    protected void handleInProgressEvent(MotionEvent event) {
        int action = event.getAction() & MotionEvent.ACTION_MASK;
        switch (action){
            case MotionEvent.ACTION_MOVE:
                updateStateByEvent(event);
                boolean update =mListener.onMove(this);
                if(update){
                    mPreMotionEvent.recycle();
                    mPreMotionEvent = MotionEvent.obtain(event);
                }
                break;
            case MotionEvent.ACTION_CANCEL:
            case MotionEvent.ACTION_UP:
                mListener.onMoveEnd(this);
                resetState();
                break;
        }
    }

    @Override
    protected void updateStateByEvent(MotionEvent event) {
        MotionEvent prev = mPreMotionEvent;
        mPrePointer = caculateFocalPointer(prev);
        mCurrentPointer = caculateFocalPointer(prev);
        boolean mSkipThisMoveEvent = prev.getPointerCount() != event.getPointerCount();
        mExtenalPointer.x = mSkipThisMoveEvent?0:mCurrentPointer.x - mPrePointer.x;
        mExtenalPointer.y = mSkipThisMoveEvent?0:mCurrentPointer.y - mPrePointer.y;

    }
    //触屏点
    private PointF caculateFocalPointer(MotionEvent event) {
        int count = event.getPointerCount();
        float x=0,y=0;
        for(int i = 0;i<count;i++){
            x+=event.getX(i);
            y+=event.getY(i);
        }

        x/=count;
        y/=count;

        return new PointF(x,y);
    }


    public float getMoveX(){
        return mExtenalPointer.x;
    }

    public float getMoveY(){
        return mExtenalPointer.y;
    }

    public static class SimpleMoveGestureDetector implements OnMoveGestureListener {

        @Override
        public boolean onMoveBegin(MYMoveGestureDetector detector) {
            return true;
        }

        @Override
        public boolean onMove(MYMoveGestureDetector detector) {
            return false;
        }

        @Override
        public boolean onMoveEnd(MYMoveGestureDetector detector) {
            return false;
        }
    }

}