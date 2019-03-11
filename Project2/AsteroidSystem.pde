public class AsteroidSystem{
  ArrayList<String> month;
  int total;
  ArrayList<Asteroid> family;
  ArrayList<Asteroid> friends;
  ArrayList<Asteroid> acqs;
  ArrayList<Asteroid> classmates;
  ArrayList<Asteroid> close;
  ArrayList<Asteroid> rp;
  ArrayList<Asteroid> coworkers;
  ArrayList<Asteroid> ff;
  ArrayList<Asteroid> dislike;
  
  
  /* CONSTRUCTOR */
  AsteroidSystem(){
    total = 0;
    
    month = new ArrayList();
    family = new ArrayList();
    friends = new ArrayList();
    acqs = new ArrayList();
    classmates = new ArrayList();
    close = new ArrayList();
    rp = new ArrayList();
    coworkers = new ArrayList();
    ff = new ArrayList();
    dislike = new ArrayList();
  }

  /* GETS DATA FROM THE CSV AND STORES IT IN ARRAYS */
  public void processRow(TableRow row){
    month.add(row.getString("Date"));
    
    int count = 0;
    int i = 0;
    
    total += row.getInt("Total");
    
    count = row.getInt("Family");
    if(count < 0){
      for(i = 0; i < count; i++){
        family.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        family.add(new Asteroid(State.FAMILY));
      }
    }
    
    count = row.getInt("Friends");
    if(count < 0){
      for(i = 0; i < count; i++){
        friends.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        friends.add(new Asteroid(State.FRIEND));
      }
    }
    
    count = row.getInt("Acquaintances");
    if(count < 0){
      for(i = 0; i < count; i++){
        acqs.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        acqs.add(new Asteroid(State.ACQ));
      }
    }
    
    count = row.getInt("Classmates");
    if(count < 0){
      for(i = 0; i < count; i++){
        classmates.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        classmates.add(new Asteroid(State.CLASSMATE));
      }
    }
    
    count = row.getInt("Close");
    if(count < 0){
      for(i = 0; i < count; i++){
        close.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        close.add(new Asteroid(State.CLOSEFRIEND));
      }
    }
    
    count = row.getInt("Romantic Partners");
    if(count < 0){
      for(i = 0; i < count; i++){
        rp.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        rp.add(new Asteroid(State.ROMANTIC));
      }
    }
    
    count = row.getInt("Coworkers");
    if(count < 0){
      for(i = 0; i < count; i++){
        family.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        acqs.add(new Asteroid(State.COWORKER));
      }
    }
    
    count = row.getInt("FamilyFriends");
    if(count < 0){
      for(i = 0; i < count; i++){
        ff.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        ff.add(new Asteroid(State.FAMFRIEND));
      }
    }
    
    count = row.getInt("Dislike");
    if(count < 0){
      for(i = 0; i < count; i++){
        dislike.remove(0);
      }
    }else{
      for(i = 0; i < count; i++){
        dislike.add(new Asteroid(State.DISLIKE));
      }
    }
  }
  
  public void update(){
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
  }
  
}
