class Tile{
  
  int xpos;
  int ypos;
  boolean isActive = true;
  
  int tileWidth = 30;
  int tileOffset = 3;
  
  Tile(int x, int y){
    xpos = x;
    ypos = y;
  }
  
  void drawTile(){
    if(isActive){
      noStroke();
      fill(255);
      rect(xpos, ypos, tileWidth, tileWidth);
      fill(150);
      triangle(xpos, ypos+tileWidth, xpos+tileWidth, ypos+tileWidth, xpos+tileWidth, ypos);
      fill(200);
      rect(xpos+tileOffset, ypos+tileOffset, tileWidth - 2*tileOffset, tileWidth - 2*tileOffset);
    }
  }
}
