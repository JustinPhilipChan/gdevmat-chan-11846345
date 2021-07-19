class Walker
{
  PVector position = new PVector(); // defaults to 0, 0
  PVector speed = new PVector(5, 8);
  int r = 182;
  int g = 52;
  int b = 100;
  
  void moveAndBounce() 
  {
  position.add(speed);
  
  if((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1; 
    //wanted to randomize color everytime ball bounces
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
  }
  
  if((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1; 
    //wanted to randomize color everytime ball bounces
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
  }
  
  fill(r, g, b);
  circle(position.x, position.y, 50);
  }
}
