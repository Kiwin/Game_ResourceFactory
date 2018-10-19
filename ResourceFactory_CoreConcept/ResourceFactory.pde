final int itemSize = 28;
int updateRate = 1;

ArrayList<Resource> items;
ArrayList<ResourceMine> mines;
ArrayList<Container> containers;

void setup() {
  //fullScreen();
  size(800, 600);

  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);
  init();
}

void init() {
  containers = new ArrayList<Container>();
  mines = new ArrayList<ResourceMine>();
  items = new ArrayList<Resource>();
  //int storageSize, float productionCooldown, ResourceType resourceType
  ResourceMine ironMine = new ResourceMine(9, 1, ResourceType.iron);
  ironMine.setPosition(width/2, height/2);
  mines.add(ironMine);
}

void draw() {
  background(0);
  for (int i = 0; i < updateRate; i++) {
    for (ResourceMine mine : mines) {
      mine.update();
    }
    for (Container container : containers) {
      container.update();
    }
    for (Resource item : items) {
      item.update();
    }
  }
  for (ResourceMine mine : mines) {
    mine.draw();
  }
  for (Container container : containers) {
    container.draw();
  }
  for (Resource item : items) {
    item.draw();
  }
}

void keyPressed() {
  if (key == 'r') {
    init();
  }
}
void mousePressed() {
  updateRate = (int)map(mouseX, 0, width, 2, 15);
}
void mouseReleased() {
  updateRate = 1;
}