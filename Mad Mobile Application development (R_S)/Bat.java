package com.example.newgame;

import android.graphics.Rect;
import android.graphics.RectF;

public class Bat
{
  private RectF rect;  //RectF Build in class can create diff functions
  private float length;
  private float x;
  private float x2;
  private float batSpeed;
  //which way the paddle move

    final int STOPPED=0;
    final int LEFT=1;
    final int RIGHT=2;
    private int batMoving=STOPPED;

    Bat(int ScreenX,int ScreenY)
    {

        x2=ScreenX;
        length=260;
        float height=60;
        x= (float) (ScreenX/2.2);
        float y=ScreenY - 135;
        rect=new RectF(x,y,x+length,y+height);
        batSpeed=650;

    }

    RectF getRect()
    {
        return rect;
    }
    void setMovementState(int State)
    {
        batMoving=State;
    }

    void update(long fps)
    {
        if(batMoving==LEFT)
        {
            x=x-batSpeed/fps;
        }
        if(batMoving==RIGHT)
        {
            x=x+batSpeed/fps;
        }


        if(rect.left<0){
            x=0;
        }
        if(rect.right>x2){
            x =x2-(rect.right -rect.left);
        }
        rect.left=x;
        rect.right=x+length;

    }

    void reset (int ScreenX,int ScreenY)
    {
        x2=ScreenX;
        length=260;
        float height=60;
        x= (float) (ScreenX/2.2);
        float y=ScreenY - 135;
        rect=new RectF(x,y,x+length,y+height);
        batSpeed=650;

    }
}
