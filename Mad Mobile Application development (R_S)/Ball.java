package com.example.newgame;

import android.graphics.RectF;

import java.util.Random;

public class Ball
{
    private RectF rect;
    private float xVelocity;
    private float yVelocity;
    private float ballWidth = 40;
    private float ballHeight = 40;

    Ball(){
        xVelocity =300;
        yVelocity =-400;
        rect = new RectF();
    }

    void update (long fps){

        rect.left = rect.left + (xVelocity/fps);
        rect.top = rect.top + (yVelocity/fps);
        rect.right = rect.left + ballWidth;
        rect.bottom = rect.top + ballHeight;
    }

    RectF getRect (){
        return  rect;
    }

    void reverseXVelocity (){
        xVelocity = -xVelocity;
    }

    void reverseYVelocity (){
        yVelocity = -yVelocity;
    }

    void setRandomXVelocity(){

        Random generator = new Random();
        int answer = generator.nextInt(2);

        if(answer == 0){
            reverseXVelocity();
        }
    }

    void reset (int x, int y){

        rect.left = x/2;
        rect.top =y -180;
        rect.right = x/2 + ballWidth;
        rect.bottom  =y -180 +ballHeight;
    }
}
