import java.util.Iterator;

/* Much of this code was inspired from these resources:
 * Processing Website (Dan Shiffman): https://processing.org/examples/simpleparticlesystem.html
 * OpenProcessing Project "Glow Worms" by Matthew Carney: https://www.openprocessing.org/sketch/632381 */
  

class ParticleSystem
{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  // Updates the positions, gravity, and alive state of the particles in the system
  void update()
  {
    Iterator<Particle> i = particles.iterator();

    while (i.hasNext()) {
      Particle p = i.next();
      
      // Remove any particles outside of the screen
      if (p.pos.x > width || p.pos.x < 0) {
        i.remove();
        continue;
      } else if (p.pos.y > height || p.pos.y < 0) {
        i.remove();
        continue;
      }
      
      // Apply gravity
      p.applyForce(PVector.random2D());
      
      // Move particle position
      p.move();
      
      // Remove dead particles
      if (p.isDead()) {
        i.remove();  
      } else {
        p.display();
      }
      
    }
  }
}
