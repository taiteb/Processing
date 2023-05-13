import geomerative.*;

color bgCol = #0A0903;
color guideColor = #CDEDFC;
color[] cols = {#78C0E0, #449DD1, #150578, #0E0E52};

float xa;
float uoff;
float[] sa;

RShape grp;
RPoint[][] points;

Agent[][] agents;
boolean guides = true;

long seed;

void setup() {
  size(1080, 1080);
  pixelDensity(2);
  background(bgCol);

  seed = (long)random(10000);
  println(seed);
  randomSeed(seed);

  RG.init(this);
  RG.ignoreStyles();
  RG.setPolygonizerLength(6);

  grp = RG.loadShape("UA5.svg");
  grp.centerIn(g, 120, 1, 1);

  points = grp.getPointsInPaths();
    
  uoff = 1;
  sa = new float[points.length];

  agents = new Agent[points.length][];

  for (int i = 0; i < points.length; i++) {
    agents[i] = new Agent[points[i].length];
    for (int j = 0; j < points[i].length; j++) {
      float x = points[i][j].x;
      float y = points[i][j].y;
      agents[i][j] = new Agent(x, y);
      if (j > 0){
            sa[i] = map(i*j, 0, 11, -TWO_PI, TWO_PI);
      }
    }
  }

  noFill();
  stroke(255);
  strokeWeight(3);
  
}

void draw() {
  background(bgCol);
  translate(width/2, height/2);
  
  //this (thru for loop) gets the points from 
  points = grp.getPointsInPaths();

  agents = new Agent[points.length][];

  for (int i = 0; i < points.length; i++) {
    agents[i] = new Agent[points[i].length];
    for (int j = 0; j < points[i].length; j++) {
      float x = points[i][j].x;
      float y = points[i][j].y;
      agents[i][j] = new Agent(x, y);
    }
  }

  noFill();
  stroke(255);
  strokeWeight(3);
  
  //for (int i = 0; i < agents[i].length; i++){
    //stroke(guideColor, 213);
    //strokeWeight(24);
    //circle(agents.length, agents[i].length, 200);
  //}
 // this iterates through the arrays of points and uses agents.brush to actually draw
  for (int i = 0; i < agents.length; i++) {
    for (int j = 0; j < agents[i].length; j++) {
      if (guides) agents[i][j].guides();
      xa = map(j, -444, 444, 0.1, PI*uoff);
      float doff = sin(sa[i] + xa);
      if (j > 0) {
        agents[i][j].brush(doff, j);
      } //else {
        //angle = agents[i][j].calcAngle(agents[i][j+1].pos, agents[i][j].pos);
        //agents[i][j].brush(angle-PI, 100);
      //}
    }
  
  }
  
  xa += 0.1;
  uoff += 0.05;
  
}

void mousePressed() {
  guides = !guides;
}
