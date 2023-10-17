interface Drawable {
  void setAngle(float angle);
  void setPosition(PVector pos);
  void setPosition(float x, float y);
  PVector getPosition();
  void draw();
  void update();
}
