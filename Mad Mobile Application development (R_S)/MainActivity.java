package com.example.newgame;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.graphics.Point;
import android.os.Bundle;
import android.view.Display;


public class MainActivity extends Activity
{

    PongEngine pongEngine;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        Display display = getWindowManager().getDefaultDisplay();       //getting screen size

        Point size= new Point();
        display.getSize(size);

        pongEngine = new PongEngine(this,size.x,size.y);
        setContentView(pongEngine);

    }

    @Override
    protected void onPause()
    {

        super.onPause();
        pongEngine.pause();

    }

    @Override
    protected void onResume()
    {
        super.onResume();
        pongEngine.resume();
    }
}
