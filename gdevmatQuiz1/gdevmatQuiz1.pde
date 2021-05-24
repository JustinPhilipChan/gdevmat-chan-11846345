float xspacing = 0.1f;
float radius = 5.0;
float theta = 0.0f;
float dt = 0.1f;
float amplitude = 50.0f;
float frequency = 0.5f;

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
 background(0);
 
  drawCartesianPlane();
  drawQuestionOne();
  drawQuestionTwo();
  drawQuestionThree();
  
  /*
    1 and 2 = amplitude change by 10
    a and s = frequency change by 0.1
  */
  
  if (keyPressed) {
   if (key == '1') {
     key = '1';
   } if (key == '2') {
     key = '2'; 
   } if (key == 'a') {
     key = 'a';
   } if (key == 's') {
     key = 's'; 
   }
  }
}

void keyReleased()
{
   if (key == '1') {
     amplitude += 10.0;
   } if (key == '2') {
     amplitude -= 10.0; 
   } if (key == 'a') {
     frequency += 0.1f;
   } if (key == 's') {
     frequency -= 0.1f; 
   }
}

void drawCartesianPlane()
{
 circle(0, 0, 4); //origin
 strokeWeight(1);
 color white = color(255, 255, 255);
 fill(white);
 stroke(white);
 line(300, 0, -300, 0);
 line(0, 300, 0, -300);
 
 for (int i = -300; i <= 300; i += 10)
 {
  line(i, -3, i, 3);
  line (-3, i, 3, i);
 }
 
}

void drawQuestionOne()
{
  /*
    f(x) = x2−15x−3   (yellow color)
    Let x be 2, then y = -29
    Let x be -1, then y = -17
  
  */
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for(float x = -100; x <= 100; x += 0.1f)
  {
    circle(x, ((x * x) + (x * 15) - 3.0) , 5);
  }
  
}

void drawQuestionTwo()
{
  /*    
    f(x) =−5x +30   (purple color)
    Let x be 2, then y = 20
    Let x be -1, then y = 35
  */
  
  color purple = color(128, 0, 128);
  fill(purple);
  stroke(purple);
  
  for (int x = -100; x <= 100; x++)
  {
    circle(x, (-5 * x) + 30 , 5);
  }
}

void drawQuestionThree()
{
  //Create a sine wave
 color red = color(255, 0, 0);
 fill(red);
 stroke(red);
 
 for (int x = -100; x <= 100; x++)
 {
   circle(x * radius, amplitude * sin(frequency*(theta + x)), radius);
 }
 
 theta+=dt;
}
