public class AsteroidSystem{
  ArrayList<String> month;
  ArrayList<Integer> total;
  ArrayList<Integer> family;
  ArrayList<Integer> friends;
  ArrayList<Integer> acqs;
  ArrayList<Integer> classmates;
  ArrayList<Integer> close;
  ArrayList<Integer> rp;
  ArrayList<Integer> coworkers;
  ArrayList<Integer> ff;
  ArrayList<Integer> dislike;
  
  int counter;
  int numEntries;
  
  ArrayList<Asteroid> asteroidList;
  
  /* CONSTRUCTOR */
  AsteroidSystem(){
    counter = 0;
    numEntries = 0;
    
    month = new ArrayList();
    total = new ArrayList();
    family = new ArrayList();
    friends = new ArrayList();
    acqs = new ArrayList();
    classmates = new ArrayList();
    close = new ArrayList();
    rp = new ArrayList();
    coworkers = new ArrayList();
    ff = new ArrayList();
    dislike = new ArrayList();
    
    asteroidList = new ArrayList();
  }

  /* GETS DATA FROM THE CSV AND STORES IT IN ARRAYS */
  public void processRow(TableRow row){
    month.add(row.getString("Date"));
    total.add(row.getInt("Total"));
    family.add(row.getInt("Family"));
    friends.add(row.getInt("Friends"));
    acqs.add(row.getInt("Acquaintances"));
    classmates.add(row.getInt("Classmates"));
    close.add(row.getInt("Close"));
    rp.add(row.getInt("Romantic Partners"));
    coworkers.add(row.getInt("Coworkers"));
    ff.add(row.getInt("FamilyFriends"));
    dislike.add(row.getInt("Dislike")); 
    numEntries+=1;
  }
  
  public void update(){
    if(counter < numEntries){
      println(month.get(counter));
    }
    // rotate
  }
  
}
