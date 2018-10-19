abstract class TransportLink extends Container implements Drawable {

  //Linked item 1
  Container startPoint;
  Container endPoint;
  float speed;
  float cooldown;
  int lastUpdateFrame;
  DegreeDisplayingProtocol displayer;

  TransportLink(float speed, float cooldown, int storageSize, Container startPoint, Container endPoint) {
    super(storageSize);
    this.startPoint = startPoint;
    this.endPoint = endPoint;
    this.speed = speed;
    this.cooldown = cooldown;
    this.lastUpdateFrame = frameCount;
    this.position = startPoint.position.copy().add(endPoint.position).mult(0.5);
    c = color(255, 50);
    displayer = new DegreeDisplayingProtocol(storage, position);
    displayer.setRadius(itemSize);
    displayer.ease = 0.15;
  }

  void draw() {
    noStroke();
    fill(#66ff66, 128);
    ellipse(startPoint.position.x, startPoint.position.y, itemSize*0.5, itemSize*0.5);
    fill(#6666ff, 128);
    ellipse(this.position.x, this.position.y, itemSize*0.5, itemSize*0.5);
    fill(#ff6666, 128);
    ellipse(endPoint.position.x, endPoint.position.y, itemSize*0.5, itemSize*0.5);

    stroke(c);
    strokeWeight(itemSize);
    line(startPoint.position.x, startPoint.position.y, endPoint.position.x, endPoint.position.y);
    strokeWeight(itemSize*0.2);
    for (int i = 0; i < storage.size(); i++) {
      Resource item = this.storage.get(i);

      stroke(c);
      line(this.position.x, this.position.y, item.position.x, item.position.y);
      item.draw();
    }
  }

  void extract() {
    Resource item = startPoint.storage.get(startPoint.storage.size()-1);
    if (this.add(item)) {
      item.setSize(itemSize*0.62);
      startPoint.storage.remove(item);
    }
  }

  void update() {
    //Pull resources from startPoint object
    if (endPoint.hasStorageSpace()) {
      if (frameCount >= lastUpdateFrame + frameRate/updateRate*cooldown) {
        if (startPoint.storage.size() > 0) {
          extract();
        }
        lastUpdateFrame = frameCount;
      }  

      //Update resources position & update resources
      for (int i = 0; i < storage.size(); i++) {
        Resource item = storage.get(i);
        item.position.add(endPoint.position.copy().sub(item.position).normalize().mult(speed));
        item.update();
      }

      //Extract resources to startPoint object
      boolean didDeleteItem = false;
      do {
        didDeleteItem = false;
        for (int i = 0; i < storage.size(); i++) {
          Resource item = storage.get(i);
          if (item.position.dist(endPoint.position) < speed*2) {
            if (endPoint.add(item)) {
              storage.remove(item);
              didDeleteItem = true;
              break;
            }
          }
        }
      } while (didDeleteItem);
    } else {
      displayer.update();
    }
  }
}