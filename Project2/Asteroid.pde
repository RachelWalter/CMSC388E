/* Each asteroid represents one friend from my Facebook friends list */
public class Asteroid{
  /* Here I'm defining circles of closeness */
  /* which will be used to create the rings of orbit */
  final int RING1 = 80; // romantic partners, family, and close friends
  final int RING2 = 160; // friends
  final int RING3 = 240; // classmates and coworkers
  final int RING4 = 320; // family friends and acquantinces
  final int RING5 = 400; // dislike
  
  /* RING1 COLORS */
  color famColor = color(124, 168, 255); //blue
  color cfColor = color(124, 142, 255); // indigo
  color romanColor = color(255, 126, 180); // pink

  /* RING2 COLORS*/
  color fColor = color(203, 126, 255); //purple

  /* RING3 COLORS*/
  color clColor =  color(126, 252, 255); //teal/light blue
  color coColor =  color(141, 255, 126); //green 

  /* RING4 COLORS*/
  color acqColor = color(255,205,124); //orange
  color ffColor = color(255, 249, 124); // yellow

  /* RING5 COLORS*/
  color dColor = color(149, 149, 149); // grey
  
  /* This makes an array of all our asteroid images */
  PImage images[] = {a1, a2, a3, a4, a5, a6, a7, a8};
  
  /* These are the instance varibles for each asteroid */
  State state; // what relation are they to me?
  PImage img; // which asteroid image will be used?
  float radius; // where will the asteroid orbit at?
  float angle; // what angle is the asteroid in its orbit
  float orbitspeed; // what speed is it oribiting at
  
  /* These boolean flags control movement behavior */
  boolean inOrbit; 
  boolean dead;
  boolean leaving;
  
  // Helps track the position before entering orbit/while leaving it
  float initRadius;
 
  /* CONSTRUCTOR */
  Asteroid(State s){
    // setting inital angle and speed
    angle = random(0,TWO_PI); 
    orbitspeed = random(0.02, 0.08);
    
    // selecting an asteroid image and resizing it
    int rand = (int)(random(0,8));
    img = images[rand].copy();
    img.resize(20,20); 
    
    // initializing our movement states, all are false to start
    inOrbit = false;
    dead = false;
    leaving = false;
    
    // the state determines the relationship,
    // so we use it to choose the radius to orbit in
    state = s;
    if(state == State.FAMILY){
      radius = RING1 + random(-15,15);
    }
    
    if(state == State.FRIEND){
      radius = RING2 + random(-15,15);
    }
    
    if(state == State.CLASSMATE){
      radius = RING3 + random(-15,15);
    }
    
    if(state == State.ACQ){
      radius = RING4 + random(-15,15);
    }
    
    if(state == State.CLOSEFRIEND){
      radius = RING1 + random(-15,15);
    }
    
    if(state == State.ROMANTIC){
      radius = RING1 + random(-15,15);
    }
    
    if(state == State.COWORKER){
      radius = RING3 + random(-15,15);
    }
    
    if(state == State.FAMFRIEND){
      radius = RING4 + random(-15,15);
    }
    
    if(state == State.DISLIKE){
      radius = RING5 + random(-15,15);
    }
    
    // we start off the screen, which would be width/2 with how we translated the image
    initRadius = (width/2);
  
  }
  
  /* DISPLAY */
  void show(){
    // use the relationship to determine the right color to tint the asteroid 
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
    
    /* IN ORBIT --> rotate around the earth at the set speed */
    if(inOrbit){
      // these tranformations make the asteroids rotate 
      // with respect to the planet
      pushMatrix();
      rotate(angle);
      translate(radius, 0);
      image(img, 0, 0);
      popMatrix();
      
      noTint();

      // update angle
      angle = (angle + orbitspeed) % TWO_PI;
    }else if(leaving){
      /* LEAVING --> do not rotate but increase radius until it exits the screen */
      pushMatrix();
      rotate(angle);
      translate(initRadius, 0);
      image(img, 0, 0);
      popMatrix();
      
      noTint();
      
      // update the radius, not the angle
      initRadius += orbitspeed*100;
      if(initRadius >= width/2){
         dead = true;
      }
    }else{
      /* ENTERING --> do not rotate but decrease radius until it enters orbit */
      pushMatrix();
      rotate(angle);
      translate(initRadius, 0);
      image(img, 0, 0);
      popMatrix();
      
      noTint();
      
      // update the radius, not the angle
      initRadius -= orbitspeed*100;
      if(initRadius <= radius){
        inOrbit = true;
      }
    }
    
  }
  
}
