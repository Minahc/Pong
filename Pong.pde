int x = 10;
int enemyX;
int enemyY;
int ballX;
int ballY;
int ballVelocityX = 1;
float ballVelocityY = 1;
int playerScore = 0;
int enemyScore = 0;
int maxVelocity = 3;
float enemyVelocity = ballVelocityY;
void setup() {
    size(500,500);
    enemyY = height/2;
    enemyX = width-10;
    reset();
    fill (255);
}

void reset() {
 ballX = width/2;
 ballY = height/2;
 enemyX = width-10;
 enemyY = height/2;
 ballVelocityY = 1;
} // resets the ball and the enemy to starting posiotions

void draw() {
    ballX += ballVelocityX;
    ballY += ballVelocityY;
    enemyY += enemyVelocity;
    
    if (ballY > enemyY + 20) {
      enemyVelocity = 1; //if the ball is below the enemy, the enemy will go down after it
    }
    else if (ballY < enemyY - 20){
     enemyVelocity = -1; //if the ball is above the enemy, the enemy will go up after it
    }
    else {
     enemyVelocity = 0; //if the ball is infront of the enemy, the enemy will stand still
    }
    
    if (enemyY + 25 > height){
     enemyY = height - 25; //makes sure enemy cannot leave screen at bottom
    }
    
    if (enemyY - 25 < 0){
     enemyY = 25; //makes sure enemy cannot leave screen at top
    }
    
    if (ballY + 5 > height) {
      ballY = height - 5;
      ballVelocityY = -ballVelocityY; //changes direction of ball on the y-axis when bottom is hit
    }
    
    if (ballY - 5 < 0) {
      ballY = 0 + 5;  
      ballVelocityY = -ballVelocityY; //changes direction of ball on the y-axis when top is hit
    }
    
    if (ballX + 5 >= enemyX - 5) {
      if (ballY >= enemyY - 25 && ballY <= enemyY + 25) {
        ballVelocityX = -1;
        ballVelocityY = ballY - enemyY;
        ballVelocityY /= 25.0/3.0; //determins speed of ball depending on where it hits the enemy padle
      }
    }
    
    if (ballX - 5 <= x + 5) {
      if (ballY >= mouseY - 25 && ballY <= mouseY + 25) {
        ballVelocityX = 1;
        ballVelocityY = ballY - mouseY;
        ballVelocityY /= 25.0/3.0;  //determins speed of ball depending on where it hits the player padle 
      }
    }
    
    if (ballX - 5 <= 0) {
     enemyScore = enemyScore + 1; //adds 1 to enemy score, when ball hits left wall
     reset();
    }
    
    if (ballX + 5 >= width) {
      playerScore = playerScore + 1; //adds 1 to player score, when ball hits right wall
      reset();
      
    }
    
    background(0);
    rectMode(CENTER);
    rect(x,mouseY,10,50); //the players padle 
    rect(enemyX,enemyY,10,50); //the enemy padle
    ellipse(ballX,ballY,10,10); //the ball
    textSize(20);
    text(playerScore,width/2-20,20);
    text(enemyScore,width/2+20,20);
}
