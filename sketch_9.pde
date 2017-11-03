import processing.sound.*;
SinOsc sin1;
SinOsc sin2;
SinOsc sin3;
SinOsc sin4;
SinOsc sin5;
int t;
boolean [][] selected;
float [][] notes;
int spacing = 50;
int a = 1;
void setup()
{
    size(800,400);
    t = 0;
    selected = new boolean[5][16];
    notes = new float[5][16];
     for(int i =0; i<5; i++)
    for(int j =0; j<16; j++)
    {
        selected[i][j] = false;
        
    }
     for(int j =0; j<16; j++)
    {
       notes[0][j] = 100;    
       notes[1][j] = 200;  
       notes[2][j] = 300; 
       notes[3][j] = 400; 
       notes[4][j] = 500; 
    }
    sin1 = new SinOsc(this);
    sin2 = new SinOsc(this);
    sin3 = new SinOsc(this);
    sin4 = new SinOsc(this);
    sin5 = new SinOsc(this);
}
void draw()
{   
    if(frameCount%15==1) 
    {
      t=(t+1*a)%16;
      sin1.stop();
      sin2.stop();
      sin3.stop();
      sin4.stop();
      sin5.stop();
       for(int i = 0; i<5; i++)
    {
       if(selected[i][t]) 
      {
        if(i ==  0)
       { sin1.freq(notes[i][t]);
        sin1.play();
       }
        if(i ==  1)
       { sin2.freq(notes[i][t]);
        sin2.play();
       }
        if(i ==  2)
       { sin3.freq(notes[i][t]);
        sin3.play();
       }
        if(i ==  3)
       { sin4.freq(notes[i][t]);
        sin4.play();
       }
        if(i ==  4)
       { sin5.freq(notes[i][t]);
        sin5.play();
       }
      }
    }
//--------------------------------------------------------
background(0);
stroke(255);
 for(int i = 0; i<5; i++)
    for(int j = 0; j<16; j++)
    {
        if(selected[i][j]) fill(150,150,255);
        else fill(255);
        if(j==t) fill(255,0,0);
        ellipse(j*spacing+(spacing-10)/2, i*spacing+10+(spacing-10)/2, spacing-10, spacing-10);
    }
}
fill(#F4FC0A);
rect(320,330,50,50);
fill(0);
rect(325,335,40,40);
//--------------------------------
noFill();
stroke(#F4FC0A);
rect(380,330,50,50);
triangle(384,334,384,376,425,355);
//-----------------------------------
fill(#F4FC0A);
rect(440,330,50,50);
fill(0);
rect(445,335,10,40);
triangle(450,355,485,335,485,375);
}
void mousePressed()
{
    int eye1 = mouseX/spacing;
    int eye2 = mouseY/spacing;
    if(eye1>-1 && eye1<16 && eye2>-1 && eye2<5) selected[eye2][eye1]=!selected[eye2][eye1];
    if(mouseX > 320 && mouseX < 370 && mouseY > 330 && mouseY < 380 )
    a = 0;
      if(mouseX > 380 && mouseX < 420 && mouseY > 330 && mouseY < 380 )
    a = 1;
     if(mouseX > 440 && mouseX < 500 && mouseY > 330 && mouseY < 380 )
    t = -1;
}