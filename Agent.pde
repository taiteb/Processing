class Agent {
  PVector pos;
  
  color col;
  
  Agent(float x, float y) {
    pos = new PVector(x, y);
    
    col = cols[(int)random(cols.length)];
  }
  
  void guides() {
    push();
    fill(guideColor);
    noStroke();
    circle(pos.x, pos.y, 10);
    pop();
  }
  
  void setCol(int index) {
    col = cols[index];
  }
  
  //float calcAngle(PVector pre, PVector pos) {
   // return atan2(pre.y-pos.y, pre.x-pos.x);
  //}
  
  void brush(float rad, int step) {
    push();
    stroke(col, 455);
    strokeWeight(abs(rad * 5));
    //translate(pos.x, pos.y);
    //rotate(angle-HALF_PI);
    //text('A', 0, 0);
    //line(-lineWidth/2, 0, lineWidth/2, 0);
    //if (step % 9 == 0){
      //noStroke();
      //fill(col, 19);
      //circle(pos.x, pos.y, rad*48);
    //}
    circle(pos.x, pos.y, rad*7);
    pop();
  }
}
