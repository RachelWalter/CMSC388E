ParticleSystem ps;

// Inits the screen and particle system
void setup(){
  fullScreen();
  background(232, 250,236);
  ps = new ParticleSystem();
}

// Each iteration it adds a new particle and updates the system (aka draws new positions)
void draw(){
  //ps.particles.add(new Particle(new PVector(random(0,width), 0))); // grow down from the top
  ps.particles.add(new Particle(new PVector(random(0,width), height))); // grow up from the bottom
  ps.update();
}
