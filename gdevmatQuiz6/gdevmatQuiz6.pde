void setup()
{
 size(1080, 720, P3D);
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
   background (130);
   PVector mouse = mousePos();
   mouse.normalize().mult(250);
   
   //red outer glow
   strokeWeight(15);
   stroke(255, 0, 0, 100);
   
   line (0, 0, mouse.x, mouse.y);
   
   // white inner glow
   strokeWeight(5);
   stroke(255, 255, 255, 150);
   
   line (0, 0, mouse.x, mouse.y);
   
   PVector backMouse = mousePos();
   backMouse.normalize().mult(50);
   
   strokeWeight(10);
   stroke(0, 0, 0);
   
   line(0, 0, -backMouse.x, -backMouse.y);
   
   PVector backLight = mousePos();
   backLight.normalize().mult(300);
   
   //red outer glow
   strokeWeight(15);
   stroke(255, 0, 0, 100);
   
   line (-backMouse.x, -backMouse.y, -backLight.x, -backLight.y);
   
   // white inner glow
   strokeWeight(5);
   stroke(255, 255, 255, 150);
   
   line (-backMouse.x, -backMouse.y, -backLight.x, -backLight.y);
}
