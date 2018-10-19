public class ResourceGrid implements Drawable{

  private ArrayList<Resource> objectList;
  private PVector position;
  float itemWidth = 1;
  float itemHeight = 1;
  float ease = 1;

  ResourceGrid(ArrayList<Resource> objects, PVector position) {
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
      int w = (round(sqrt(objectList.size())));      
      item.getPosition().add(this.position.copy().sub(item.getPosition()).add(new PVector((i%w)*(itemWidth*1.5), (i/w)*(itemHeight*1.5))).mult(ease));
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
    return this.position;
  }

  void setSize(float w, float h) {
    this.itemWidth = w;
    this.itemHeight = h;
  }
  void setSize(float size) {
    this.itemWidth = size;
    this.itemHeight = size;
  }
}