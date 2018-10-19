class VoidChest extends Container {

  VoidChest() {
    super(9999);
  }
  int radius = 100;
  void draw() {   
    noStroke();
    fill(#992299, 75);
    ellipse(position.x, position.y, radius, radius);
    for (int i = 0; i < storage.size(); i++) {
      Resource item = storage.get(i);
      item.draw();
    }
  }
  void update() {
    for (int i = 0; i < storage.size(); i++) {
      Resource item = storage.get(i);
      
      //item.position.x += random(-3, 3);
      //item.position.y += random(-3, 3);
      float itemSize = item.getScale();
      item.position.x += sin(frameCount*updateRate*0.1+i)*0.1*itemSize;
      item.position.y += cos(frameCount*updateRate*0.1+i)*0.1*itemSize;
      
      item.setScale(0);
      item.setScaleEase(0.01);
      item.update();
      if (itemSize < 0.01) {
        storage.remove(item);
      }
    }
  }
}