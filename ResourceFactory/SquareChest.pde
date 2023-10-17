class SquareChest extends Container {

  private RootDisplayingProtocol displayer;

  SquareChest(int storageSize) {
    super(storageSize);
    displayer = new RootDisplayingProtocol(storage, position);
    displayer.setSize(itemSize);
    displayer.ease = 0.05;
    c = #00ff00;
  }

  void draw() {   
    noStroke();
    fill(c, 40);
    rect(position.x, position.y, 100, 100);
    strokeWeight(itemSize*0.2);
    for (int i = 0; i < storage.size(); i++) {
      Resource item = this.storage.get(i);
      stroke(c, 30);
      line(this.position.x, this.position.y, item.position.x, item.position.y);
    }
    displayer.draw();
  }
  void update() {

    displayer.update();

    for (int i = 0; i < storage.size(); i++) {
      Resource item = storage.get(i);
      //Update positionition
      item.setSize(itemSize);
    }
  }
}