Walker[] walkers = new Walker[10];
void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 resetSetup();
}

void draw()
{
 background (80);
 noStroke();

 for(Walker w: walkers)
 {
   w.render();
   w.update();
   for(Walker x: walkers)
   {
     if (x != w)
     {
      x.applyForce(w.calculateAttraction(x)); 
     }
   }
 }
}

void mousePressed()
{
 resetSetup(); 
}

void resetSetup()
{
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    
    walkers[i].position.x = random(-500, 500);
    walkers[i].position.y = random(-200, 200);
    
    walkers[i].mass = random(1, 12);
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = int(random(256));
    walkers[i].g = int(random(256));
    walkers[i].b = int(random(256));
    walkers[i].a = int(random(200, 256));
  }
}
