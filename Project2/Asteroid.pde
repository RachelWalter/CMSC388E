public class Asteroid{
  final int RING1 = 80; // romantic partners, family, and close friends
  final int RING2 = 130; // friends
  final int RING3 = 180; // classmates and coworkers
  final int RING4 = 230; // family friends and acquantinces
  final int RING5 = 280; // dislike
  
  /* RING1 */
  color famColor = color(124, 168, 255); //blue
  color cfColor = color(124, 142, 255); // indigo
  color romanColor = color(203, 126, 255); //purple

  /* RING2 */
  color fColor = color(124, 228, 255); //light blue

  /* RING3 */
  color clColor =  color(126, 255, 232); //tealish
  color coColor =  color(141, 255, 126); //green 

  /* RING4 */
  color ffColor = color(255,205,124); //orange
  color acqColor = color(255, 249, 124); // yellow

  /* RING5 */
  color dColor = color(255, 126, 137); // red
  
  PImage images[] = {a1, a2, a3, a4, a5, a6};
  
  State state;
  PImage img;
  float radius;
  float angle;
  float orbitspeed;
  boolean inOrbit;
  float initRadius;
 
  /* CONSTRUCTOR */
  Asteroid(State s){
    angle = random(0,TWO_PI);
    orbitspeed = random(0.02, 0.08);
    int rand = (int)(random(0,6));
    img = images[rand].copy();
    img.resize(20,20); 
    
    inOrbit = false;
    
    state = s;
    if(state == State.FAMILY){
      radius = RING1 + random(-10,10);
    }
    
    if(state == State.FRIEND){
      radius = RING2 + random(-10,10);
    }
    
    if(state == State.CLASSMATE){
      radius = RING3 + random(-10,10);
    }
    
    if(state == State.ACQ){
      radius = RING4 + random(-10,10);
    }
    
    if(state == State.CLOSEFRIEND){
      radius = RING1 + random(-10,10);
    }
    
    if(state == State.ROMANTIC){
      radius = RING1 + random(-10,10);
    }
    
    if(state == State.COWORKER){
      radius = RING3 + random(-10,10);
    }
    
    if(state == State.FAMFRIEND){
      radius = RING4 + random(-10,10);
    }
    
    if(state == State.DISLIKE){
      radius = RING5 + random(-10,10);
    }
    
    initRadius = (width/2);
  
  }
  
  /* DISPLAY */
  void show(){
    State s = state; 
    if(s == State.FAMILY){
      tint(famColor);
    }
    
    if(s == State.FRIEND){
      tint(fColor);
    }
    
    if(s == State.CLASSMATE){
      tint(clColor);
    }
    
    if(s == State.ACQ){
      tint(acqColor);
    }
    
    if(s == State.CLOSEFRIEND){
      tint(cfColor);
    }
    
    if(s == State.ROMANTIC){
      tint(romanColor);
    }
    
    if(s == State.COWORKER){
      tint(coColor);
    }
    
    if(s == State.FAMFRIEND){
      tint(ffColor);
    }
    
    if(s == State.DISLIKE){
      tint(dColor);
    }
    
    if(inOrbit){
      pushMatrix();
      rotate(angle);
      translate(radius, 0);
      image(img, 0, 0);
      popMatrix();
      
      noTint();
      
      // update angle
      angle = (angle + orbitspeed) % TWO_PI;
    }else{
      pushMatrix();
      rotate(angle);
      translate(initRadius, 0);
      image(img, 0, 0);
      popMatrix();
      
      noTint();
      
      initRadius -= orbitspeed*100;
      if(initRadius <= radius){
        inOrbit = true;
      }
    }
    
  }
  
}
