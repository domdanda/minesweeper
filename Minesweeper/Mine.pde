class Mine{
  
  int xPos;
  int yPos;
  boolean isActive;
  
  Mine(int x, int y, boolean a){
    xPos = x;
    yPos = y;
    isActive = a;
  }
  
  void drawMine(){
    int mineWidth = tile.tileWidth*5/10;
    
    fill(0);
    ellipse(xPos, yPos, mineWidth, mineWidth);
    
    stroke(0);
    strokeWeight(2);
    strokeCap(SQUARE);
    line(xPos, yPos-mineWidth*3/4, xPos, yPos+mineWidth*3/4);
    line(xPos-mineWidth*3/4, yPos, xPos+mineWidth*3/4, yPos);
    strokeWeight(1);
    line(xPos-mineWidth/2, yPos-mineWidth/2, xPos+mineWidth/2, yPos+mineWidth/2);
    line(xPos+mineWidth/2, yPos-mineWidth/2, xPos-mineWidth/2, yPos+mineWidth/2);
    fill(255);
    noStroke();
    ellipse(xPos-mineWidth/5, yPos-mineWidth/5, mineWidth/4, mineWidth/4);
  }
}
