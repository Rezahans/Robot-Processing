float x = 110; // x coordinate
float y = 300; // y coordinate
int radius = 45; // Head radius
int bodyHeight = 180; // Body height
int neckHeight = 40; // Neck height
float easing = 0.04;
int xPos = 110;
void setup() {
  size(400, 400);
  ellipseMode(RADIUS);
}

void draw() {
  strokeWeight(2);
  float neckY = -1 * (bodyHeight + neckHeight + radius);
  background(0, 153, 204);
  translate(x,y); // Move all to (mouseX, y)

  //4, 5
  if (mousePressed && (mouseButton == LEFT)) {
    scale(1.0);
  }
  else if(mousePressed && (mouseButton == RIGHT)) {
    scale(0.3); // 60% size when mouse is pressed
  }else{
    scale(0.6);
  }
  
  //1, 2, 3
  if(keyPressed){
      if(key == 'x' || key == 'X'){
          translate(mouseX,0);
      }else if(key == 'y' || key == 'Y'){
          translate(0,mouseY);
      }else if(key == 'z' || key == 'Z'){
          translate(mouseX,mouseY);
      }
      
      //6, 7
      else if(key == 'r' || key == 'R'){
          translate(xPos,150); // Move all to (mouseX, y)
          xPos=xPos+1;

          for(int i=0; i<100; i++){
              fill(0);
              rect(-100, -bodyHeight, 10, bodyHeight-100);
              rect(100, -bodyHeight, 10, bodyHeight-100);
              fill(0);
              rect(-50, -bodyHeight, 10, bodyHeight-100);
              rect(40, -bodyHeight, 10, bodyHeight-100); 
          }
          if (xPos>width+20)
          {
            xPos=-20;
          }
      }else if (key == 's' || key == 'S'){
        translate(xPos,0);
      }
  }
  
  // Body
  noStroke();
fill(255, 204, 0);
ellipse(-20, -33, 20, 20);
fill(255, 204, 0);
ellipse(20, -33, 20, 20);
  fill(0);
  rect(-45, -bodyHeight, 90, bodyHeight-33);
   // Neck
  
  
  stroke(255);
  line(12, -bodyHeight, 12, neckY);
  // Hair
  pushMatrix();
  translate(12, neckY);
  float angle = -PI/30.0;
  
  for (int i = 0; i <= 30; i++) {
    line(80, 0, 0, 0);
    rotate(angle);
  }
  popMatrix();
  // Head
  noStroke();
  fill(0);
  ellipse(12, neckY, radius, radius);
  fill(255);
  ellipse(24, neckY-6, 14, 14);
  fill(0);
  ellipse(24, neckY-6, 3, 3);
}
