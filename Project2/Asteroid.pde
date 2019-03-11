public class Asteroid{
  final int RING1 = 40; // romantic partners, family, and close friends
  final int RING2 = 80; // friends
  final int RING3 = 120; // classmates and coworkers
  final int RING4 = 160; // family friends and acquantinces
  final int RING5 = 200; // dislike
  
  /* RING1 */
  color famColor = color(255, 154, 134); //red-orange
  color cfColor = color(183, 54, 95); // red-purple
  color romanColor = color(255, 126, 137); //red
  
  /* RING2 */
  color fColor = color(149, 129, 89); // brown 1
  
  /* RING3 */
  color clColor =  color(255, 248, 28); // yellow
  color coColor =  color(255, 218, 28); //gold
  
  /* RING4 */
  color ffColor = color(255,170,0); //orange
  color acqColor = color(255, 200, 0); // orange-yellow
  
  /* RING5 */
  color dColor = color(137, 93, 4); // brown 2
  
  PImage images[] = {a1, a2, a3, a4, a5, a6};
  
  State state;
  PImage img;
  float radius;
  float angle;
  float orbitspeed;
 
  /* CONSTRUCTOR */
  Asteroid(State s){
    angle = random(0,TWO_PI);
    orbitspeed = random(0.05, 0.15);
    int rand = (int)(random(0,6));
    img = images[rand].copy();
    img.resize(20,20); 
    
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
    
    pushMatrix();
    rotate(angle);
    translate(radius + (earth.width/50), (earth.height/50));
    image(img, 0, 0);
    popMatrix();
    
    noTint();
    
    // update angle
    angle = (angle + orbitspeed) % TWO_PI;
    
  }
  
}
