class CircleChest extends Container {

  private DegreeDisplayingProtocol displayer;

  CircleChest(int storageSize) {
    super(storageSize);
    displayer = new DegreeDisplayingProtocol(storage, position);
    displayer.setRadius(itemSize*1.5);
    displayer.ease = 0.05;
  }

  void draw() {   
    noStroke();
    fill(#00ff00, 40);
    ellipse(position.x, position.y, 100, 100);
    strokeWeight(itemSize*0.2);
    for (int i = 0; i < storage.size(); i++) {
      Resource item = this.storage.get(i);
      stroke(c,30);
      line(this.position.x, this.position.y, item.position.x, item.position.y);
    }
    displayer.draw();
  }
  void update() {
    displayer.setRadius(itemSize*1.5+storage.size());
    displayer.update();
    for (int i = 0; i < storage.size(); i++) {
      Resource item = storage.get(i);
      //Update positionition
      item.setSize(itemSize);
    }
  }
}