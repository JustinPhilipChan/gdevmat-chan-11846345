Walker[] walkers = new Walker[100];


void setup()
{
 size(1280, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
 for (int i = 0; i < walkers.length; i++)
 {
  walkers[i] = new Walker(); // initialize 100 walkers
  //random pos x and y
  walkers[i].position.x = random(-640, 641);
  walkers[i].position.y = random(-360, 361);
  walkers[i].scale = random(1, 20);
 }
 
}

void draw()
{
  background(0);
  noStroke();
  for (Walker w : walkers)
  {
    float x = mouseX - Window.windowWidth / 2;
    float y = -(mouseY - Window.windowHeight / 2); 
    PVector mouse = new PVector(x, y);
    PVector direction = PVector.sub(mouse, w.position);
    direction.normalize();
    w.acceleration = direction;
    w.acceleration.mult(0.2);
    
    w.update();
    w.render();
  }
}
