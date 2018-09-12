int x = 10;
int enemyX;
int enemyY;
int ballX;
int ballY;
int ballVelocityX = 1;
int ballVelocityY = 1;
void setup() {
    size(500,500);
    enemyY = height/2;
    enemyX = width-10;
    ballX = width/2;
    ballY = height/2;
}

void draw() {
    ballX += ballVelocityX;
    ballY += ballVelocityY;
    enemyY = ballY;
    
    if (ballY + 5 >= height) {
        ballVelocityY = -1; 
    }
    
    if (ballY - 5 <= 0) {
        ballVelocityY = 1;
    }
    
    if (ballX + 5 >= enemyX - 5) {
      if (ballY >= enemyY - 25 && ballY <= enemyY + 25) {
        ballVelocityX = -1;
      }
    }
    
    if (ballX - 5 <= x + 5) {
      if (ballY >= mouseY - 25 && ballY <= mouseY + 25) {
        ballVelocityX = 1;
      }
    }
    
    background(0);
    rectMode(CENTER);
    rect(x,mouseY,10,50);
    rect(enemyX,enemyY,10,50);
    ellipse(ballX,ballY,10,10);
}
