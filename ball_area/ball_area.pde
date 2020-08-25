Ball[] balls;
double sum = 0 ;
int amount = 5; // amount of objects.
boolean check_ball;

void setup() { 
  size(600, 600);
  background(200);
  balls = new Ball[amount];

  for (int x = 0; x < amount; x++) {
    balls[x] = new Ball(random(50, 550), random(50, 550), random(50, 250));
  }

  for (Ball ball : balls) {   
    sum +=ball.getArea();
  }

  println ("sum of area is", sum);
}

void draw() {
  background(255);
  for (Ball ball : balls) { 
    ball.create_ball();
  }
}


class Ball {
  float positionX, positionY, size;
  color random_color;

  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = size; 
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
  }
  void create_ball() {
    color white = color(255);
    //color[] colors = {white, random_color};
    //int rand = int(random(0, 2));
    fill(random_color);
    ellipse(this.positionX, this.positionY, this.size, this.size);
  }
  public float getArea() {
    float area ;
    area = 22/7 * (size/2) *(size/2);
    return area ;
  }
}

char[] delete_indexball = {' ', ' ', ' ', ' ', ' '} ; // array of deleted object ball

void mouseClicked() {
  Ball[] balllist_left;
  Ball[] balllist_right;
  check_ball = true;
  if (check_ball) {
    for (int i = balls.length-1; i >= 0; i = i - 1) { // find the ball where clicked and delete it 
      float dis = dist(mouseX, mouseY, balls[i].positionX, balls[i].positionY);
      if (dis < balls[i].size/2) {
        sum -= balls[i].getArea();
        println("this ball area is", balls[i].getArea());
        println("New sum of area is", sum);

        for ( int j = 0; j <balls.length-1; j++) {
          if ( delete_indexball[j] !=  ' ' ) {
            delete_indexball[j+1] = char (j); // take delete object index to delete_indexball array
          } else {
          } 
          delete_indexball[j] = char (j);
        }

        balllist_left = (Ball[])subset (balls, 0, i);
        balllist_right = (Ball[])subset (balls, i+1 );
        balls = (Ball[])concat(balllist_left, balllist_right);
        check_ball = false;
        break;
      }
    }
  }
}

void keyPressed() {
  if (key == 'z') {
  Ball[] balllist_left;
  Ball[] balllist_right;
  delete_indexball // last index that know 
  }
}
