class Walker
{
 float x, y, r, g, b, rad;
 float tr = 0;
 float tg = 0;
 float tb = 0;
 float trad = 0;
 float tx = 0, ty = 10000;
 void render()
 {
   fill(r, g, b, 255);
   noStroke();
   circle(x, y, rad);
 }
 
 void perlinWalk()
 {
   /*
    Quiz 4
    Retain the perlin walk implementation
    The scale/thiccness of the Walker should change through Perlin as well. Make sure to implement its own "t", and map it to values 5 to 150.
    The RGB values of fill must also change through Perlin. Make sure to implement their own "t". Map the values of RGB to 0 to 255. A value should be 255 (default).
   */
   
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   r = map(noise(tr), 0, 1, 0, 255);
   g = map(noise(tg), 0, 1, 0, 255);
   b = map(noise(tb), 0, 1, 0, 255);
   rad = map(noise(trad), 0, 1, 5, 150);
   
   tx += 0.01f;
   ty += 0.01f;
   tr += 0.02f;
   tg += 0.03f;
   tb += 0.01f;
   trad += 0.01f;
 }

}
