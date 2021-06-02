void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
 background(0);
}

void draw()
{
  /*
      Simulate a Paint Splatter on a canvas
      x coordinates = randomGaussian
      y coordinates = random() <--- max min = top and bottom of the screen
      SCALE / THICKNESS of circles should be randomized using randomGaussian()
      colors = random() <--- 0-255 rgb 10-100 alpha
  */
  float gaussian = randomGaussian();
  float standardDeviation = 100;
  float mean = 0;
  float x = standardDeviation * gaussian + mean;
  float y = random(-360, 360); //size of screen height
  
  float circleGaussian = randomGaussian();
  float circleDeviation = 20;
  float circleMean = 0;
  float rad = circleDeviation * circleGaussian + circleMean;
  
  int alph = int(random(9, 101));
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  
  noStroke();
  fill(r, g, b, alph);
  circle(x, y, rad);
  
}
