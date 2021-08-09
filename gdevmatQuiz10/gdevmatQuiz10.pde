Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];
void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 resetSetup();
}

void draw()
{
 background(255);
 
 ocean.render();
 for(Walker w: walkers)
 {
   w.render();
   w.update();
   PVector wind = new PVector(0.1, 0);
   PVector gravity = new PVector(0, -0.15f * w.mass);
   w.applyForce(gravity);
   w.applyForce(wind);
   
   float c = 0.1f;
   float normal = 1;
   float frictionMagnitude = c * normal;
   PVector friction = w.velocity.copy();
   w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
 
   if (w.position.y <= Window.bottom)
   {
     w.position.y = Window.bottom;
     w.velocity.y *= -1;
   }
 
   if (ocean.isCollidingWith(w))
   {
     PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
   }
 }
 
}

void mouseClicked()
{
  resetSetup();
}

void resetSetup()
{
  int posX = 0;
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    posX = (Window.widthPx / 10) * (i - 5);
    walkers[i].position.x = posX;
    walkers[i].position.y = 300;
    
    walkers[i].mass = 11 - i;
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = int(random(256));
    walkers[i].g = int(random(256));
    walkers[i].b = int(random(256));
    walkers[i].a = 255;
  }
}
