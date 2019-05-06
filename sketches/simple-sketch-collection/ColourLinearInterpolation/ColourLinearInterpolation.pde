/*
  Demo of linear colour interpolation using lerpColor(),
 with two rows of colour ranges.
 */
int boxWidth;
int boxHeight;
int gapWidth;
int gapHeight;

/* Exit on any key press. */
void keyPressed() {
  exit();
}

void draw() {
  // needed for keyPressed to be called
}

void setup() {
  stroke(255);
  background(51);
  //size(800, 800);
  fullScreen();
  int strokeWeight = 5;
  int gap = 20;
  boxWidth = width - strokeWeight * 2 - gap; 
  boxHeight = height - strokeWeight * 2 - gap;
  gapWidth = (width - boxWidth) / 2;
  gapHeight = (height - boxHeight) / 2;
  strokeWeight(strokeWeight);

  color[] colorSteps = new color[10];
  for (int i = 0; i < colorSteps.length; i++) {
    float step = i / (float) colorSteps.length;
    colorSteps[i] = lerpColor(
        color(204, 50, 0),   // from this color
        color(50, 102, 153), // to this color
        step                 // interpolation step x, where (0 <= x <= 1)
      );
  }
  // Second row, with new colours
  
  color[] colorSteps2 = new color[20];
  for (int i = 0; i < colorSteps2.length; i++) {
    float step = i / (float) colorSteps.length;
    colorSteps2[i] = lerpColor(
        #00FFCE,   // from this color
        #FA5305,   // to this color
        step       // interpolation step x, where (0 <= x <= 1)
      );
  }

  drawBoxes(new PVector(gapWidth, gapHeight), colorSteps);
  drawBoxes(new PVector(gapWidth, boxHeight/2), colorSteps2);
}

void drawBoxes(PVector origin, color[] interps) {
  pushMatrix();
  translate(origin.x, origin.y);
  for (int i = 0; i < interps.length; i++) {
    fill(interps[i]);
    rect(0, 0, boxWidth / interps.length, boxHeight / 2);
    translate(boxWidth / interps.length, 0);
  }
  popMatrix();
}
