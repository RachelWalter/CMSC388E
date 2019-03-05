public class Asteroid{
  final int RING1 = 20; // romantic partners, family, and close friends
  final int RING2 = 50; // friends
  final int RING3 = 80; // classmates and coworkers
  final int RING4 = 110; // family friends and acquantinces
  final int RING5 = 140; // dislike
  
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
  
  int myRing;
  float myRadius;
  color myColor;
  String classifier;
  
  /* CONSTRUCTOR */
  Asteroid(int ring, String classifier){
    myRing = ring;
    myRadius = getRingRadius(ring);
    myRadius += random(-10,10);  
    this.classifier = classifier;
    myColor = getRightColor(classifier);
  }
  
  /* RETRIEVES COLOR BASED ON RELATIONSHIP */
  private color getRightColor(String classifier){
    if(classifier.equals("fam")){
      return famColor;
    }else if(classifier.equals("rp")){
      return romanColor;
    }else if(classifier.equals("cf")){
      return cfColor;
    }else if(classifier.equals("f")){
      return fColor;
    }else if(classifier.equals("ff")){
      return ffColor;
    }else if(classifier.equals("co")){
      return coColor;
    }else if(classifier.equals("acq")){
      return acqColor;
    }else if(classifier.equals("cl")){
      return clColor;
    }else{
      return dColor;
    } 
  }
  
  /* RETRIEVES RADIUS BASED ON RING */
  private int getRingRadius(int ring){
    if(ring == 1){
      return RING1;
    }else if(ring == 2){
      return RING2;
    }else if(ring == 3){
      return RING3;
    }else if(ring == 4){
      return RING4;
    }else{
      return RING5;
    }
  }
  
}
