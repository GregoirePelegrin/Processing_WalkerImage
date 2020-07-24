class Walker{
  ArrayList<PVector> points;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float timeX;
  float timeY;
  boolean inBounds;
  
  Walker(float xs, float ys){
    this.points = new ArrayList<PVector>();
    this.xPos = random(photo.width);
    this.yPos = random(photo.height);
    this.points.add(new PVector(xPos, yPos));
    this.xSpeed = xs;
    this.ySpeed = ys;
    this.timeX = random(10000);
    this.timeY = random(10000);
    this.inBounds = true;
  }
  
  void update(){
    if(this.inBounds){
      PVector next_point = new PVector();
      float curr_xSpeed;
      float curr_ySpeed;
      if(this.points.size() == 0){
        curr_xSpeed = this.xSpeed;
        curr_ySpeed = this.ySpeed;
      } else {
        float varX = noise(timeX);
        float varY = noise(timeY);
        varX = map(varX, 0, 1, -rand, rand);
        varY = map(varY, 0, 1, -rand, rand);
        curr_xSpeed = varX;
        curr_ySpeed = varY;
        this.timeX += timeStep;
        this.timeY += timeStep;
      }
      this.xPos += curr_xSpeed;
      this.yPos += curr_ySpeed;
      next_point.x = this.xPos;
      next_point.y = this.yPos;
      this.xSpeed = curr_xSpeed;
      this.ySpeed = curr_ySpeed;
      this.points.add(next_point);
      if(this.xPos < 0 || this.xPos > photo.width || this.yPos < 0 || this.yPos > photo.height){     
        this.inBounds = false;
      }
    }
  }
  
  void display(){
    if(this.inBounds){
      PVector pointA = points.get(0);
      PVector pointB = points.get(1);
      PVector col = colors[int(this.xPos)][int(this.yPos)];
      stroke(col.x, col.y, col.z);
      line(pointA.x, pointA.y, pointB.x, pointB.y);
      points.remove(0);
    }
  }
}
