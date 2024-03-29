class DegreeDisplayingProtocol implements Drawable {
  
  ArrayList<Resource> objectList;
  PVector position;
  float radius = 10;
  float ease = 0.2;
  
  DegreeDisplayingProtocol(ArrayList<Resource> objects, PVector position) {
    this.objectList = objects;
    this.position = position;
  }
  
  void draw() {
    for (int i = 0; i < objectList.size(); i++) {
      Drawable item = objectList.get(i);
      item.draw();
    }
  }
  
  void update() {
    for (int i = 0; i < objectList.size(); i++) {
      Drawable item = objectList.get(i);
      
      //Update Object Position
      float angle = radians(360 / objectList.size() * i);
      float x = this.position.x + sin(angle) * radius;
      float y = this.position.y + cos(angle) * radius;
      PVector targetPos = new PVector(x, y);
      item.setPosition(item.getPosition().add(targetPos.sub(item.getPosition()).mult(ease)));
      item.update();
    }
  }
  
  void setPosition(float x, float y) {
    this.position.x = x;
    this.position.y = y;
  }
  void setPosition(PVector position) {
    this.position = position;
  }
  
  void setAngle(float angle) {
  }
  PVector getPosition() {
    return this.position.copy();
  }
  
  void setRadius(float radius) {
    this.radius = radius;
  }
}
