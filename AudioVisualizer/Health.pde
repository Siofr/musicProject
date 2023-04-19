class Health {
  
  PVector healthPosition, healthColour;
  float healthWidth, healthHeight;
  
  Health(PVector healthPosition, float healthWidth, float healthHeight, PVector healthColour) {
    this.healthPosition = healthPosition;
    this.healthWidth = healthWidth;
    this.healthHeight = healthHeight;
    this.healthColour = healthColour;
  }
  
  void createHealth() {
    fill(healthColour.x, healthColour.y, healthColour.z);
    rect(healthPosition.x, healthPosition.y, healthWidth, healthHeight);
  }
}
