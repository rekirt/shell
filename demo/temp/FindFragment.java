package com.iss.drc.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.opengl.GLSurfaceView;
import android.opengl.GLU;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.SeekBar;

import com.iss.drc.R;
import com.lidroid.xutils.ViewUtils;
import com.lidroid.xutils.view.annotation.ViewInject;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

/**
 * fucker
 */
public class FindFragment extends BaseFragment {

    private Interpolator accelerator = new AccelerateInterpolator();
    private Interpolator decelerator = new DecelerateInterpolator();

    @ViewInject(R.id.fl_pinpin_home)
    View fl_pinpin_home;
    @ViewInject(R.id.fl_pinpin_fucklist)
    View fl_pinpin_fucklist;
    @ViewInject(R.id.bt_fuck_jingwei)
    ImageView bt_fuck_jingwei;

    GLSurfaceView gview;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_bigpenies_page, container, false);
        ViewUtils.inject(this,view);
        super.initView(view, savedInstanceState);
        titleTv.setText("拼拼");
        backBtn.setVisibility(View.GONE);
        fl_pinpin_fucklist.setVisibility(View.GONE);
        gview   = new GLSurfaceView(getActivity());
        gview.setRenderer(new OpenGLRender());
        return gview;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        bt_fuck_jingwei.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                flipit();
            }
        });

    }

    @Override
    public void onResume() {
        super.onResume();
        gview.onResume();
    }

    @Override
    public void onPause() {
        super.onPause();
        gview.onPause();
    }

    private void flipit() {
        final View visiblefragment;
        final View invisiblefragment;
        if (fl_pinpin_home.getVisibility() == View.GONE) {
            visiblefragment = fl_pinpin_fucklist;
            invisiblefragment = fl_pinpin_home;
        } else {
            invisiblefragment = fl_pinpin_fucklist;
            visiblefragment = fl_pinpin_home;
        }
        ObjectAnimator visToInvis = ObjectAnimator.ofFloat(visiblefragment, "rotationY", 0f, 90f);
        visToInvis.setDuration(500);
        visToInvis.setInterpolator(accelerator);
        final ObjectAnimator invisToVis = ObjectAnimator.ofFloat(invisiblefragment, "rotationY",-90f, 0f);
        invisToVis.setDuration(500);
        invisToVis.setInterpolator(decelerator);
        visToInvis.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator anim) {
                visiblefragment.setVisibility(View.GONE);
                invisToVis.start();
                invisiblefragment.setVisibility(View.VISIBLE);
            }
        });
        visToInvis.start();
    }

    class OpenGLRender implements GLSurfaceView.Renderer{

        @Override
        public void onSurfaceCreated(GL10 gl, EGLConfig config) {
            gl.glClearColor(0.0f,0.5f,0.5f,1.0f);//rgba
            gl.glShadeModel(GL10.GL_SMOOTH);//设置平滑|渐变
            gl.glClearDepthf(1.0f);//
            gl.glEnable(GL10.GL_DEPTH_TEST);
            gl.glDepthFunc(GL10.GL_LEQUAL);
            gl.glHint(GL10.GL_PERSPECTIVE_CORRECTION_HINT,GL10.GL_NICEST);

        }

        @Override
        public void onDrawFrame(GL10 gl) {
            gl.glClear(GL10.GL_COLOR_BUFFER_BIT | GL10.GL_DEPTH_BUFFER_BIT);
            //int mode int first int count
            //mode =GL_POINTS,GL_LINE_STRIP,GL_LINE_LOOP,GL_LINES,GL_TRIANGLES,GL_TRIANGLE_FAN
            //drawPoint(gl);
            //drawLines(gl);
            //drawTriangle(gl);
            drawIcosahedron(gl);
        }

        float angle;
        /**
         * 画20面体
         * @param gl
         */
        private void drawIcosahedron(GL10 gl) {
            //初始化数据
            float X = 0.525731112119133606f;
            float Z = 0.850650808352039932f;
            float vertices[] = new float[]{
                    -X,0.0f,Z,X,0.0f,Z,-X,0.0f,-Z,X,0.0f,-Z,
                    0.0f,Z,X,0.0f,Z,-X,0.0f,-Z,X,0.0f,-Z,-X,
                    Z,X,0.0f,-Z,X,0.0f,Z,-X,0.0f,-Z,-X,0.0f
            };
            short[] indices = new short[]{
                    0,4,1,0,9,4,9,5,4,4,5,8,4,8,1,
                    8,10,1,8,3,10,5,3,8,5,2,3,2,7,3,
                    7,10,3,7,6,10,7,11,6,11,0,6,0,1,6,
                    6,1,10,9,0,11,9,11,2,9,2,5,7,2,11
            };
            float[] colors = {
                    0f,0f,0f,1f,
                    0f,0f,1f,1f,
                    0f,1f,0f,1f,
                    1f,0f,0f,1f,
                    1f,0f,1f,1f,
                    1f,1f,0f,1f,
                    1f,1f,1f,1f,
                    1f,0f,0f,1f,
                    0f,1f,0f,1f,
                    0f,0f,1f,1f,
                    1f,0f,1f,1f
            };
            FloatBuffer vertexBuffer;
            FloatBuffer colorBuffer;
            ShortBuffer indexBuffer;

            ByteBuffer vbb = ByteBuffer.allocateDirect(vertices.length*4);
            vbb.order(ByteOrder.nativeOrder());
            vertexBuffer = vbb.asFloatBuffer();
            vertexBuffer.put(vertices);
            vertexBuffer.position(0);

            ByteBuffer cbb = ByteBuffer.allocateDirect(colors.length*4);
            colorBuffer = cbb.asFloatBuffer();
            colorBuffer.put(colors);
            colorBuffer.position(0);

            ByteBuffer ibb = ByteBuffer.allocateDirect(indices.length*2);
            ibb.order(ByteOrder.nativeOrder());
            indexBuffer = ibb.asShortBuffer();
            indexBuffer.put(indices);
            indexBuffer.position(0);


            //画图
            gl.glColor4f(1.0f,0.0f,0.0f,1.0f);
            gl.glLoadIdentity();
            gl.glTranslatef(0,0,-4);
            gl.glRotatef(angle,0,1,0);
            gl.glFrontFace(GL10.GL_CCW);
            gl.glEnable(GL10.GL_CULL_FACE);
            gl.glCullFace(GL10.GL_BACK);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glVertexPointer(3,GL10.GL_FLOAT,0,vertexBuffer);

            gl.glEnableClientState(GL10.GL_COLOR_ARRAY);
            gl.glColorPointer(4,GL10.GL_FLOAT,0,colorBuffer);
            gl.glDrawElements(GL10.GL_TRIANGLES,indices.length,GL10.GL_UNSIGNED_SHORT,indexBuffer);
            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glDisable(GL10.GL_CULL_FACE);
            angle++;

        }

        /**
         * 画三角形
         * @param gl
         */
        private void drawTriangle(GL10 gl) {
            float[] vertexArray = new float[]{
                    -0.8f,-0.4f*1.732f,0.0f,
                    0.0f,-0.4f*1.732f,0.0f,
                    -0.4f,0.4f*1.732f,0.0f,
                    0.0f,0.0f*1.732f,0.0f,
                    0.8f,-0.0f*1.732f,0.0f,
                    0.4f,0.4f*1.732f,0.0f,
            };
            ByteBuffer vbb = ByteBuffer.allocateDirect(vertexArray.length*4);
            vbb.order(ByteOrder.nativeOrder());
            FloatBuffer vertex = vbb.asFloatBuffer();
            vertex.put(vertexArray);
            vertex.position(0);
            gl.glLoadIdentity();
            gl.glTranslatef(0,0,-4);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glVertexPointer(3,GL10.GL_FLOAT,0,vertex);
            switch (index){
                case 0:
                case 1:
                case 2:
                    gl.glColor4f(1.0f,0.0f,0.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_TRIANGLES,0,6);
                    break;
                case 3:
                case 4:
                case 5:
                    gl.glColor4f(0.0f,1.0f,0.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_TRIANGLE_STRIP,0,6);
                    break;
                case 6:
                case 7:
                case 8:
                case 9:
                    gl.glColor4f(0.0f,0.0f,1.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_TRIANGLE_FAN,0,6);
                    break;
            }
            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);

        }


        int index =1;
        /**
         * 画线
         * @param gl
         */
        private void drawLines(GL10 gl) {
            float[] vertexArray = new float[]{
                    -0.8f,-0.4f*1.732f,0.0f,
                    -0.4f,0.4f*1.732f,0.0f,
                    0.0f,-0.4f*1.732f,0.0f,
                    0.4f,0.4f*1.732f,0.0f,
            };
            ByteBuffer vbb = ByteBuffer.allocateDirect(vertexArray.length*4);
            vbb.order(ByteOrder.nativeOrder());
            FloatBuffer vertex = vbb.asFloatBuffer();
            vertex.put(vertexArray);
            vertex.position(0);
            gl.glLoadIdentity();
            gl.glTranslatef(0,0,-4);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glVertexPointer(3,GL10.GL_FLOAT,0,vertex);
//            index++;
//            index%=10;
            switch (index){
                case 0:
                case 1:
                case 2:
                    gl.glColor4f(1.0f,0.0f,0.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_LINES,0,4);
                    break;
                case 3:
                case 4:
                case 5:
                    gl.glColor4f(0.0f,1.0f,0.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_LINE_STRIP,0,4);
                    break;
                case 6:
                case 7:
                case 8:
                case 9:
                    gl.glColor4f(0.0f,0.0f,1.0f,1.0f);
                    gl.glDrawArrays(GL10.GL_LINE_LOOP,0,4);
                    break;
            }

            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);


        }

        /**
         * 画三个点
         * @param gl
         */
        private void drawPoint(GL10 gl) {
            float[] vertexArray = new float[]{
                    -0.8f,-0.4f*1.732f,0.0f,
                    0.8f,-0.4f*1.732f,0.0f,
                    0.0f,0.4f*1.732f,0.0f,
                    };
            ByteBuffer vbb = ByteBuffer.allocateDirect(vertexArray.length*4);
            vbb.order(ByteOrder.nativeOrder());
            FloatBuffer vertex = vbb.asFloatBuffer();
            vertex.put(vertexArray);
            vertex.position(0);
            gl.glColor4f(0.0f,0.0f,1.0f,1.0f);
            gl.glPointSize(8f);
            gl.glLoadIdentity();
            gl.glTranslatef(0,0,-4);
            gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
            gl.glVertexPointer(3,GL10.GL_FLOAT,0,vertex);
            gl.glDrawArrays(GL10.GL_POINTS,0,3);
            gl.glDisableClientState(GL10.GL_VERTEX_ARRAY);

        }

        @Override
        public void onSurfaceChanged(GL10 gl, int width, int height) {
            gl.glViewport(0,0,width,height);
            gl.glMatrixMode(GL10.GL_PROJECTION);
            gl.glLoadIdentity();
            GLU.gluPerspective(gl,45.0f,(float)width/(float)height,0.1f,100.0f);
            gl.glMatrixMode(GL10.GL_MODELVIEW);
            gl.glLoadIdentity();
        }

    }





}
