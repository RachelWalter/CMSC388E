/* MOOD: GROWTH */ 
/* To me this mood/theme represents both physical growth, like plants 
 * blooming and emerging in the spring, but also the personal growth from 
 * changing and improving ones ownself. Like how each spring new flowers
 * and leaves make the world new and green again, taking certain actions (from small 
 * stuff like flossing every day to big stuff like mastering a new hobby) make you
 * a new person over time. Even without conscious effort, life is always throwing 
 * things your way that make you a different, hopefully improved indivdual */
class ColorPalette
{
      // This lets me easily change the random number generation, in case I add or remove colors
      public static final int NUM_COLORS = 6;
      
     /* YELLOW - joy and satisfaction...
      * Beautiful flowers (or even "ugly" dandelion weeds) popping up
      * and the happy shining feeling you get from reaching a goal.
      * In the words of Coldplay, it's all yellow */
     public final color yellow = color(247, 222, 92); 
     public final color yellowOutline = color(219, 191, 46);
     
     /* GREEN - nature and new life...
      * It is considered the color of life, renewal, nature, and energy.
      * It is associated with meanings of growth, harmony, freshness, safety, 
      * fertility, and environment (BourneCreative.com). */
     public final color green = color(125, 214, 122);
     public final color greenOutline = color(57, 165, 42);
     
     /* MINT - fresh and clean ...
      * You know the feeling of your mouth after you brush your teeth?
      * Or when you take a really long shower? Or when you start a new &
      * beautiful friendship? Sometimes you just need a fresh start to
      * reach contententment */
     public final color mint = color(184, 250,217);
     public final color mintOutline = color(132, 198, 166);
     
     /* DARK GREEN - digging deep...
      * Growth doesn't just happen. Seeds are buried dark underground for 
      * sometimes months. Even just considered all the late night study
      * breakdowns you have had throughout your CS career. The dark of the
      * night is what makes the sunrise truly spectacular */
     public final color dGreen = color(72, 139, 88);
     public final color dGreenOutline = color(40, 93, 53);
     
     /* PURPLE - royalty and success ...
      * What are you working towards? While we all want the utter joy
      * promised to us by YELLOW, how do we want to achieve happiness? 
      * Growth can sometimes mean improving yourself to get more power, 
      * money, or attention. */
     public final color purple = color(210, 175, 245);
     public final color purpleOutline = color(143,127, 160);
     
     /* MUTED GREEN -  unnoticable changes...
      * The grand canyon was built by a river carving into it for 
      * hundreds of years. You don't notice the second by second 
      * growth rate of the tree in your yard. Even in our lives it
      * may happen so subtly or slowly we miss it until one we wake
      * up as someone we no longer recognize */
     public final color mGreen = color(145, 209, 156);
     public final color mGreenOutline = color(107, 167, 117);
     
     // These arrays make the colors organized with their outline color 
     public color palette[] = {yellow, green, mint, dGreen, purple, mGreen};
     public color outlines[] = {yellowOutline, greenOutline, mintOutline, dGreenOutline, purpleOutline, mGreenOutline};
     
     // Easier accessing because of weird errors when trying to index arrays
     public color getColorAtIndex(int n){
       return palette[n];
     }
     
     // Easier accessing because of weird errors when trying to index arrays
     public color getOutlineAtIndex(int n){
       return outlines[n];
     }
     
}
