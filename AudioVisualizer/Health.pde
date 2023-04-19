class Health {
  
  PVector healthPosition;
  float healthWidth, healthHeight;
  
  Health(PVector healthPosition, float healthWidth, float healthHeight) {
    this.healthPosition = healthPosition;
    this.healthWidth = healthWidth;
    this.healthHeight = healthHeight;
  }
  
  void createHealth() {
    rect(healthPosition.x, healthPosition.y, healthWidth, healthHeight);
  }
}
