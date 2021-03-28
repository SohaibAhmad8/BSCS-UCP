package com.example.newgame;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.Log;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class PongEngine extends SurfaceView implements Runnable
{

    private Thread gameThread=null;
    private SurfaceHolder ourHolder;
    public volatile boolean playing;
    public boolean paused;

    private Canvas canvas;
    private Paint paint;

    private int screenX;
    private int screenY;


    private long fps;
    private long timeThisFrame;

    int lives = 3;
    int score = 0;
    int count;
    int numBlocks;
    int temp;

    Bat bat;
    Ball ball;
    Block [] blocks = new Block[200];
    Block [] Oblocks = new Block[300];
    Block [] bottomBlock = new Block[200];

    public PongEngine(Context context, int x, int y)
    {

        super(context);

        ourHolder = getHolder();
        paint =new Paint();

        screenX = x;
        screenY = y;
        bat=new Bat(screenX,screenY);
        ball = new Ball();

        setGame();

    }

    @Override
    public void run()
    {
        while(playing)
        {

            if (!paused)
            {
                update();
            }
            draw();
        }

    }
    public void pause()
    {
        playing=false;
        try
        {
            gameThread.join();
        }
        catch(InterruptedException e)
        {
            Log.e("Error","Joining Thread ");
        }

    }
    public void resume(){
        playing=true;
        gameThread=new Thread(this);
        gameThread.start();
    }
    public void update()
    {
         bat.update(60);
         ball.update(60);

         for(int i=0 ; i<numBlocks;i++)
         {
             if(blocks[i].getVisibility())
             {
                 if(RectF.intersects(blocks[i].getRect(),ball.getRect())){
                     if(i==6 || i==8|| i==12 || i==14 || i==15 ||i==17 || i==21 || i==23)
                     {
                         ball.reverseXVelocity();
                         blocks[i].setIsVisible();
                         score =score+0;
                     }
                     else
                     {
                         ball.reverseXVelocity();
                         blocks[i].setIsVisible();
                         score=score+10;
                     }
                 }
             }
         }

        for(int i=0 ; i<count;i++){
            if(Oblocks[i].getVisibility()){
                if(RectF.intersects(Oblocks[i].getRect(),ball.getRect())){
                    Oblocks[i].setIsVisible();
                    if(i==32 || i==33 || i==34 || i==53 || i==54 ||i==55 || i==74 || i==75 || i==76)
                    {

                        ball.reverseXVelocity();
                        Oblocks[i].setIsVisible();
                        score =score+5;
                    }

                }
            }
        }


         if(RectF.intersects((bat.getRect()),ball.getRect())){
             ball.setRandomXVelocity();
             ball.reverseYVelocity();

         }

         if(ball.getRect().bottom >screenY){
             ball.reverseYVelocity();
             lives --;

             if(lives == 0){
                 paused =true;
                 setGame();
             }
         }

         if(ball.getRect().top<0){
             ball.reverseYVelocity();
         }

         if(ball.getRect().right >screenX){
             ball.reverseXVelocity();
         }
        if(ball.getRect().left <0){
            ball.reverseXVelocity();
        }

         if(score == 265){
             paused =true;
             setGame();
         }


    }
    void setGame()
    {
        ball.reset(screenX, screenY);
        bat.reset(screenX,screenY);
        int blockWidth=screenX/10;
        int blockHeight=screenX/18;

        int OrngblockWidth=screenX/15;
        int OrngblockHeight=screenX/18;

        int BottomblockWidth=screenX/1;
        int BottomblockHeight=screenX/22;

        numBlocks=0;
        count=0;
        temp=0;

        for(int col=0;col<10;col++)
        {
            for(int row=0;row<3;row++)
            {
                blocks[numBlocks]=new Block(row,col,blockWidth,blockHeight);
                numBlocks++;

            }
        }
        for(int col=0;col<15;col++)
        {
            for(int row=0;row<7;row++)
            {
                Oblocks[count]=new Block(row,col,OrngblockWidth,OrngblockHeight);

                count++;

            }
        }


       for(int col=0;col<1;col++)
        {
            for(int row=0;row<15;row++)
            {
                bottomBlock[temp]=new Block(row,col,BottomblockWidth,BottomblockHeight);

                temp++;
            }
        }
        score=0;
        lives=3;

    }

    public void draw()
    {
        if(ourHolder.getSurface().isValid())
        {
            canvas = ourHolder.lockCanvas();
            canvas.drawColor(Color.argb(255, 252, 249, 249)); //white background
            //batColor
            paint.setColor(Color.argb(255, 96, 96, 96));
            canvas.drawRect(bat.getRect(), paint);
            //blue
            paint.setColor(Color.argb(255, 0, 102, 204));
            canvas.drawOval(ball.getRect(), paint);

            for(int i=0;i<numBlocks;i++)
            {
                if (blocks[i].getVisibility())
                {
                    if(i==6 || i==8||i==21 || i==23)
                   {
                        //green
                        paint.setColor(Color.argb(255, 0, 102, 0));
                        canvas.drawRect(blocks[i].getRect(),paint);
                    }
                    else if(i==12 || i==14||i==15 || i==17)
                    {
                        //red
                        paint.setColor(Color.argb(255, 250, 26, 26));
                        canvas.drawRect(blocks[i].getRect(),paint);
                    }
                    else
                    {
                        //skyblue
                        paint.setColor(Color.argb(255, 50, 200, 200));
                        canvas.drawRect(blocks[i].getRect(),paint);
                    }
                }

            }

            //.......................................//


            for(int i=0;i<count;i++)
            {
                if (Oblocks[i].getVisibility())
                {
                    if(i==32 || i==33 || i==34 || i==53 || i==54 ||i==55 || i==74 || i==75 || i==76)
                    {
                        //orange
                        paint.setColor(Color.argb(255, 255, 128, 0));
                        canvas.drawRect(Oblocks[i].getRect(),paint);
                    }
                }
            }


            //.......................................//

            for(int i=0;i<temp;i++)
            {
                if (bottomBlock[i].getVisibility())
                {
                    if(i==11)
                    {
                        //orange
                        paint.setColor(Color.argb(255, 192, 192, 192));
                        canvas.drawRect(bottomBlock[i].getRect(),paint);
                    }
                }
            }

            paint.setColor(Color.argb(255, 0, 0, 0));
            paint.setTextSize(50);
            canvas.drawText("Score: " + score, 500, 1060, paint);
            canvas.drawText(" Green " , 950, 1060, paint);
            canvas.drawText(" Lives: " + lives, 1350, 1060, paint);

            ourHolder.unlockCanvasAndPost(canvas);
        }


    }
    public boolean onTouchEvent(MotionEvent motionevent)
    {
        switch(motionevent.getAction() & MotionEvent.ACTION_MASK)
        {
            case MotionEvent.ACTION_DOWN:
                paused = false;
                if (motionevent.getX() > screenX / 2)
                {
                    bat.setMovementState(bat.RIGHT);
                }
                else
                    {
                    bat.setMovementState(bat.LEFT);

                }
                break;
            case MotionEvent.ACTION_UP:
                bat.setMovementState(bat.STOPPED);
                break;
        }
        return true;

    }
}
