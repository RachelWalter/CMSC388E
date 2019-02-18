class Particle
{
  final static float BOUNCE = -0.5;
  final static float MAX_SPEED = 0.05; // used to be 0.1
  
  // This section defines the color for the particle trail
  ColorPalette p = new ColorPalette();
  int randomNum = (int)(random(0,ColorPalette.NUM_COLORS));
  color myFill = p.getColorAtIndex(randomNum);
  color myOutline = p.getOutlineAtIndex(randomNum);
  
  /* Much of this code was inspired from these resources:
  * Processing Website (Dan Shiffman): https://processing.org/examples/simpleparticlesystem.html
  * OpenProcessing Project "Glow Worms" by Matthew Carney: https://www.openprocessing.org/sketch/632381 */
  
  // These variables control the velocity and acceleration
  PVector vel = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  PVector acc = new PVector(0, 0);
  PVector pos;
  
  // These variables control mass/size which subsequently affect movement abd look
  float mass = random(2, 2.5);
  float size = random(0.1, 2.0);
  int lifespan = 255;
  
  // creating a new particle
  Particle(PVector p)
  {
    pos = new PVector (p.x, p.y);
    acc = new PVector (random(0.1, 0.5), 0); // originally random(0.1, 1.5)
  }
  
  // This method applies velocity and acceleration to choose movement
  public void move()
  {
    vel.add(acc); // Apply acceleration
    pos.add(vel); // Apply our speed vector
    acc.mult(0);
    
    size += 0.01; //0.015
    lifespan--;
  }
  
  // applies a force to the movement
  public void applyForce(PVector force) 
  {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  // shows the current position of the particle on the screen
  public void display()
  {
    fill(myFill);
    stroke(myOutline);
    
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
  
  // detects if a particle has outlived its lifecycle
  public boolean isDead()
  {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
