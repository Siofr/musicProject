class Health {
  
  PVector healthPosition, healthColour, textColour;
  float healthWidth, healthHeight;
  
  Health(PVector healthPosition, float healthWidth, float healthHeight, PVector healthColour, PVector textColour) {
    this.healthPosition = healthPosition;
    this.healthWidth = healthWidth;
    this.healthHeight = healthHeight;
    this.healthColour = healthColour;
    this.textColour = textColour;
  }
  
  void createHealth() {
    pushMatrix();
    translate(healthPosition.x, healthPosition.y);
    fill(healthColour.x, healthColour.y, healthColour.z);
    rect(0, 0, healthWidth, healthHeight);
    popMatrix();
    
    pushMatrix();
    translate(healthPosition.x, healthPosition.y);
    fill(textColour.x, textColour.y, textColour.z);
    textAlign(CENTER);
    text("HEALTH", 100, 40);
    popMatrix();
  }
}
