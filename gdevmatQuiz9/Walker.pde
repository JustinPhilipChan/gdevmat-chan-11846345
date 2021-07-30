public class Walker {
 
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  
  public float scale = 15;
  public float mass = 1;
  public float velocityLimit = 10;
  public int r, g, b;
  
  public Walker(){}
  
  public void render()
  {
    fill(r, g, b);
    circle(position.x, position.y, scale); 
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
   this.acceleration.mult(0); //reset
  }
}
