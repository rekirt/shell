package com.example.bigrongchatdemo;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;

import java.util.List;

/**
 * Author: lc
 * Email: rekirt@163.com
 * Date: 16-3-27.
 */
public class CircleAdapter extends BaseAdapter {

    private List<String> mData;

    @Override
    public int getCount() {
        return mData.size();
    }

    @Override
    public Object getItem(int position) {
        return mData.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        return null;
    }

}
