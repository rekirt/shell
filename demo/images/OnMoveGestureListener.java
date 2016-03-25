package com.iss.drc.view.calenderview;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-25
 */
public interface OnMoveGestureListener {

    boolean onMoveBegin(MYMoveGestureDetector detector);
    boolean onMove(MYMoveGestureDetector detector);
    boolean onMoveEnd(MYMoveGestureDetector detector);
}
