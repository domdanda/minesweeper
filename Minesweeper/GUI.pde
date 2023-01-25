class GUI{
  int lineThickness = 5;
  int topBarHeight = 60;
  
  public int[] smileyButtonDimensions = new int[3];
  
  //check if the mouse is over the smiley button
  boolean smileyHover(){
    if(mouseX>smileyButtonDimensions[0] && mouseX<smileyButtonDimensions[0]+smileyButtonDimensions[2] && 
    mouseY>smileyButtonDimensions[1] && mouseY<smileyButtonDimensions[1]+smileyButtonDimensions[2]){
      return true;
    }
    else return false;
  }
  
  void drawSmileyButton(){
    //instructions to draw the smiley face
    int buttonWidth = topBarHeight*5/7;
    int buttonXPos = (width/2)-(buttonWidth/2);
    int buttonYPos = lineThickness*2+(topBarHeight-buttonWidth)/2;
    int buttonLineThickness = 3;
    
    int smileyWidth = buttonWidth*7/9;
    int smileyYPos = buttonYPos+buttonWidth/2;
    int smileyXPos = buttonXPos+buttonWidth/2;
    
    smileyButtonDimensions[0] = buttonXPos;
    smileyButtonDimensions[1] = buttonYPos;
    smileyButtonDimensions[2] = buttonWidth;
    
    noStroke();
    fill(150);
    rect(buttonXPos, buttonYPos, buttonWidth, buttonWidth);
    fill(255);
    triangle(buttonXPos, buttonYPos, buttonXPos+buttonWidth, buttonYPos, buttonXPos, buttonYPos+buttonWidth);
    fill(200);
    rect(buttonXPos+buttonLineThickness, buttonYPos+buttonLineThickness, buttonWidth-buttonLineThickness*2, buttonWidth-buttonLineThickness*2);
    
    strokeWeight(1);
    stroke(0);
    fill(255, 255, 0);
    ellipse(smileyXPos, smileyYPos, smileyWidth, smileyWidth);
    
    stroke(0);
    strokeWeight(2);
    strokeCap(PROJECT);
    point(smileyXPos-smileyWidth/5, smileyYPos-smileyWidth/6);
    point(smileyXPos+smileyWidth/5, smileyYPos-smileyWidth/6);
    
    if(mousePressed){
      fill(0);
      ellipse(smileyXPos, smileyYPos+(smileyWidth/5), smileyWidth/5, smileyWidth/5);
    }else{
      noFill();
      strokeWeight(1);
      strokeCap(ROUND);
      arc(smileyXPos, smileyYPos, smileyWidth*1/2, smileyWidth*1/2, 0+(PI/5), PI-(PI/5));
      }
  }
  
  void drawTopBar(){
    noStroke();
    fill(150);
    rect(lineThickness*2, lineThickness*2, width-lineThickness*4, topBarHeight);
    fill(255);
    rect(lineThickness*3, lineThickness*3, width-lineThickness*5, topBarHeight - lineThickness);
    triangle(lineThickness*2, topBarHeight + lineThickness*2, lineThickness*3, topBarHeight + lineThickness, lineThickness*3, topBarHeight + lineThickness*2);
    triangle(width-lineThickness*2, lineThickness*2, width-lineThickness*2, lineThickness*3, width-lineThickness*3, lineThickness*3);
    fill(200);
    rect(lineThickness*3, lineThickness*3, width-lineThickness*6, topBarHeight-lineThickness*2);
    
    drawSmileyButton();
  }
  
  void drawGameContainer(){
    noStroke();
    fill(150);
    rect(lineThickness*2, lineThickness*3+topBarHeight, width-lineThickness*4, height-lineThickness*5-topBarHeight);
    fill(255);
    rect(lineThickness*3, lineThickness*4+topBarHeight, width-lineThickness*5, height-lineThickness*6-topBarHeight);
    triangle(lineThickness*2, height-lineThickness*2, lineThickness*3, height - lineThickness*2, lineThickness*3, height - lineThickness*3);
    triangle(width-lineThickness*2, lineThickness*3+topBarHeight, width-lineThickness*2, lineThickness*4+topBarHeight, width-lineThickness*3, lineThickness*4+topBarHeight);
    fill(200);
    rect(lineThickness*3, lineThickness*4+topBarHeight, width-lineThickness*6, height-lineThickness*7-topBarHeight);
  }
  
  void drawGUI(){
    fill(200);
    rect(lineThickness, lineThickness, width-lineThickness*2, height-lineThickness*2);
    drawTopBar();
    drawGameContainer();
  }
}
