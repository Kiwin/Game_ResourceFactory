class ResourceMine extends Machine {

  private DegreeDisplayingProtocol displayer;

  private ResourceType resourceType;

  ResourceMine(int storageSize, float productionCooldown, ResourceType resourceType) {
    super(storageSize, productionCooldown);
    this.resourceType = resourceType;

    displayer = new DegreeDisplayingProtocol(storage, this.position);
    displayer.setRadius(itemSize*1.2);
    displayer.ease = 0.05;
  }

  void draw() {
    noStroke();
    fill(c, 60);
    ellipse(position.x, position.y, 100, 100);
    for (int i = 0; i < storage.size(); i++) {
      Resource item = this.storage.get(i);
      stroke(c, 30);
      line(this.position.x, this.position.y, item.position.x, item.position.y);
    }
    displayer.draw();
  }
  @Override
  void update(){
    super.update();
    displayer.update();
  }
  
  boolean produce() {
    Resource newItem = null;
    switch(resourceType) {
    case iron:
      newItem = new Iron(this.position.x,this.position.y);
      break;
    case gold:
      newItem = new Gold(this.position.x,this.position.y);
      break;
    case diamond:
      newItem = new Diamond(this.position.x,this.position.y);
      break;
    default:
      break;
    }
    if (newItem != null) {
      newItem.setPosition(this.position.x, this.position.y);
      newItem.setSize(itemSize);
      if (this.add(newItem)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}