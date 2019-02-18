class ColorPalette
{
      // This lets me easily change the random number generation, in case I add or remove colors
      public static final int NUM_COLORS = 6;
      
     /* Yellow - represents the joy and satisfaction that comes from improving yourself */
     public final color yellow = color(247, 222, 92); 
     public final color yellowOutline = color(219, 191, 46);
     
     /* Green - often tightly associated with growth because of plants */
     public final color green = color(125, 214, 122);
     public final color greenOutline = color(57, 165, 42);
     
     /* Mint - it's fresh and new, like how you feel so clean after brushing your teeth */
     public final color mint = color(184, 250,217);
     public final color mintOutline = color(132, 198, 166);
     
     /* Dark Green - you need to dig deep to truly change */
     public final color dGreen = color(72, 139, 88);
     public final color dGreenOutline = color(40, 93, 53);
     
     /* Purple - represents royalty and success; to me growth is very much about improving your own standing and gaining success */
     public final color purple = color(210, 175, 245);
     public final color purpleOutline = color(143,127, 160);
     
     /* Muted Green - because growth often happens seemingly average and unnoticable */
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
