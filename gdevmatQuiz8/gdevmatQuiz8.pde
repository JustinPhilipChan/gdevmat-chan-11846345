Walker walkers[] = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 for (int i = 0; i < walkers.length; i++)
 {
   walkers[i] = new Walker();
   
   walkers[i].position.x = -500;
   walkers[i].position.y = 200;
   
   walkers[i].mass = random(1, 11);
   walkers[i].scale = walkers[i].mass * 15;
   walkers[i].r = int(random(256));
   walkers[i].g = int(random(256));
   walkers[i].b = int(random(256));
 }
}

void draw()
{
 background(130);
 
 for (int x = 0; x < walkers.length; x++)
 {
   walkers[x].render();
   walkers[x].update();
   walkers[x].applyForce(wind);
   walkers[x].applyForce(gravity);
 
   if (walkers[x].position.x >= Window.right)
   {
      walkers[x].velocity.x *= -1;
   }
   else if (walkers[x].position.x <= Window.left)
   {
      walkers[x].velocity.x *= -1;
   }
    
   if (walkers[x].position.y <= Window.bottom)
   {
      walkers[x].velocity.y *= -1;
   }
 }
 
}
