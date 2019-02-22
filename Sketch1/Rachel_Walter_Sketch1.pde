ParticleSystem ps;

/* MOOD: GROWTH */ 
/* In addition to the color palette's mood, I wanted the composition to 
 * reflect the same mood. The particles move from the bottom  of the screen 
 * in a general upwards direction. Each particle has its own journey which
 * may bump into, overlap with, or completely disregard other particles (much
 * like how we each go through our own lives and purposes around/affected yet 
 * still independent from each other). As the particle moves, it leaves its trail
 * behind so we can see the progress. I also liked how it looked like a timelapse
 * of vines and plants overtaking a wall, like the literal/physical definition of 
 * growth */

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

//the tutorials had mechanism that made the particles fade as the moved,
// but I liked how it looks sort of vine/plant like when they layered together
