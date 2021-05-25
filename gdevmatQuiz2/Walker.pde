class Walker
{
 float x;
 float y;
 //color
 void render()
 {
   int alph = int(random(51)) + 50;
   int r = int(random(256));
   int g = int(random(256));
   int b = int(random(256));
   
   fill(r, g, b, alph);
   noStroke();
   circle(x, y, 30);
 }
 
 void randomWalk()
 {
   int rng = int(random(8));
   
   if (rng == 0) { // up
     y += 5;
   }
   else if (rng == 1) { //down
     y -= 5; 
   }
   else if (rng == 2) { //right
     x += 5;
   }
   else if (rng == 3) { //up right corner
     x += 5;
     y += 5;
   }
   else if (rng == 4) { //down right corner
     x += 5;
     y -= 5;
   } 
   else if (rng == 5) { //down left corner
     x -= 5;
     y -= 5;
   }
   else if (rng == 6) { //left
     x-= 5;
   }
   else if (rng == 7) { // up left
     x -= 5;
     y += 5;
   }
  
 }
 
 void randomWalkBiased()
 {
   //what I did was that I added 2 more rng numbers for the RIGHT side and LOWER RIGHT side, making the chances of it getting picked 20% while the rest get 10%
   
     int rng = int(random(10));
   
   if (rng == 0) { // up
     y += 5;
   }
   else if (rng == 1) { //down
     y -= 5; 
   }
   else if (rng == 2 || rng == 8) { //right
     x += 5;
   }
   else if (rng == 3) { //up right corner
     x += 5;
     y += 5;
   }
   else if (rng == 4 || rng == 9) { //down right corner
     x += 5;
     y -= 5;
   } 
   else if (rng == 5) { //down left corner
     x -= 5;
     y -= 5;
   }
   else if (rng == 6) { //left
     x-= 5;
   }
   else if (rng == 7) { // up left
     x -= 5;
     y += 5;
   }
 }
}
