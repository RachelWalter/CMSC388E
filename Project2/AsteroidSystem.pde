String date; // the current time period of data

public class AsteroidSystem{
  int total; // the total number of asteroids - just for record keeping purposes

  /* Each arraylist tracks the friends in each category *
   * makes managing all the people much easier!! */
  ArrayList<Asteroid> family;
  ArrayList<Asteroid> friends;
  ArrayList<Asteroid> acqs;
  ArrayList<Asteroid> classmates;
  ArrayList<Asteroid> close;
  ArrayList<Asteroid> rp;
  ArrayList<Asteroid> coworkers;
  ArrayList<Asteroid> ff;
  ArrayList<Asteroid> dislike;
  ArrayList<Asteroid> leaving;
  ArrayList<Asteroid> dead;
  
  
  /* CONSTRUCTOR */
  AsteroidSystem(){
    // initial the total and date
    total = 0;
    date = "";
    
    /* Initializing all our ArrayLists for maintaining data */
    family = new ArrayList();
    friends = new ArrayList();
    acqs = new ArrayList();
    classmates = new ArrayList();
    close = new ArrayList();
    rp = new ArrayList();
    coworkers = new ArrayList();
    ff = new ArrayList();
    dislike = new ArrayList();
    leaving = new ArrayList();
    dead = new ArrayList();
  }

  /* GETS DATA FROM THE CSV AND STORES IT IN ARRAYS */
  public void processRow(TableRow row){
    /* Sets the current date so it can be printed on the screen-  
     * this will help the viewer see the changes over time */
    date = row.getString("Date");
    println(date);
    
    /* variables to process the number of 
    / asteroids (people) per category */
    int count = 0;
    int i = 0;
    
    // Add to the total number, just in case we need it
    total += row.getInt("Total");
    
    /* FOR EACH COLUMN IN THE CSV:
    *  1. We get the number of asteroids to add/remove
    *  2. If we are losing asteroids, we put them in the leave queue
    *  3. If we are adding asteroids, we are making a new asteroid and 
    *     adding to the right queue */
    count = row.getInt("Family");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = family.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        family.add(new Asteroid(State.FAMILY));
      }
    }
    
    count = row.getInt("Friends");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = friends.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        friends.add(new Asteroid(State.FRIEND));
      }
    }
    
    count = row.getInt("Acquaintances");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = acqs.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        acqs.add(new Asteroid(State.ACQ));
      }
    }
    
    count = row.getInt("Classmates");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = classmates.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        classmates.add(new Asteroid(State.CLASSMATE));
      }
    }
    
    count = row.getInt("Close");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = close.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        close.add(new Asteroid(State.CLOSEFRIEND));
      }
    }
    
    count = row.getInt("Romantic Partners");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = rp.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        rp.add(new Asteroid(State.ROMANTIC));
      }
    }
    
    count = row.getInt("Coworkers");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = coworkers.remove(0);
        leaving.add(a);
        a.leaving = true;
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        coworkers.add(new Asteroid(State.COWORKER));
      }
    }
    
    count = row.getInt("FamilyFriends");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = ff.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        ff.add(new Asteroid(State.FAMFRIEND));
      }
    }
    
    count = row.getInt("Dislike");
    if(count < 0){
      count*=-1;
      for(i = 0; i < count; i++){
        Asteroid a = dislike.remove(0);
        leaving.add(a);
        a.leaving = true; 
        a.inOrbit = false;
      }
    }else{
      for(i = 0; i < count; i++){
        dislike.add(new Asteroid(State.DISLIKE));
      }
    }
    
    /* END SETTING UP DATA USING CSV FILE */
  }
  
  public void update(){
    /* FOR EACH LIST:
    *  1. Go through each asteroid in the list
    *  2. Update the location on the screen */
    
    for(Asteroid a: family){
      a.show();
    }
    
    for(Asteroid a: friends){
      a.show();
    }
    
    for(Asteroid a: acqs){
      a.show();
    }
    
    for(Asteroid a: classmates){
      a.show();
    }
    
    for(Asteroid a: coworkers){
      a.show();
    }
    
    for(Asteroid a: close){
      a.show();
    }
    
    for(Asteroid a: rp){
      a.show();
    }
    
    for(Asteroid a: ff){
      a.show();
    }
    
    for(Asteroid a: dislike){
      a.show();
    }
    
    /* END SHOWING THE "ALIVE" ASTEROIDS */
    
    /* if the asteroid was added to the leaving list, 
     * then we keep updating it until it's dead (off screen) */
    for(Asteroid a: leaving){
      a.show();
      if(a.dead){
        dead.add(a);
      }
    }
    
    /* Didn't want to get an exception by removing and looping at the same time
     * so the dead queue removes them from the leave queue and clears itself out 
     * at the end */
    for(Asteroid a: dead){
      leaving.remove(a);
    }
    dead = new ArrayList();
  }
  
}
