package com.example.newgame;

import android.graphics.RectF;

public class Block
{
    private RectF rect;
    private Boolean isVisible;
    Block(int row,int column,int width,int height)
    {
        isVisible=true;
        int padding=1;
        rect=new RectF(column * width + padding,
                row * height + padding,
                column * width + width - padding,
                row * height + height - padding);


    }


    RectF getRect()
    {
        return this.rect;
    }

    void setIsVisible()
    {
        isVisible=false;
    }
    boolean getVisibility()
    {
        return isVisible;
    }

}

