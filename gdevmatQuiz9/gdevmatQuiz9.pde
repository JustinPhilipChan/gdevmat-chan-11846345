Walker[] walkers = new Walker[8];

void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 resetSetup();
}

void draw()
{
  background(220);
  
  stroke(0);
  strokeWeight(3);
  line(0, -360, 0, 360);
  noStroke();
  
  for (Walker w : walkers)
  {
    //sorry i copy pasted this sir pero nag crash yung processing ko after our consultation and hindi ko siya nasave HAHAHA
    PVector acceleration = new PVector(0.2 / w.mass, 0);
    w.applyForce(acceleration);
    
    float mew = 0.01f;

    if (w.position.x >= 0)
    {
        mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy().mult(-1).normalize().mult(frictionMagnitude);
    w.applyForce(friction);
    
    w.render();
    w.update();
  }
}

void mouseClicked()
{
  resetSetup();
}

void resetSetup()
{
  int posY = 0;
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    posY = (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));
 
    walkers[i].position.x = (-500);
    walkers[i].position.y = posY;
    
    walkers[i].mass = 9 - i;
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = int(random(256));
    walkers[i].g = int(random(256));
    walkers[i].b = int(random(256));
  }
}
