abstract class Container implements Drawable {
  
  //Container Object for storing resources
  
  float angle;
  int storageSize;
  ArrayList<Resource> storage;
  PVector position;
  TransportLink output;
  color c;
  Container(int storageSize) {
    storage = new ArrayList<Resource>();
    position = new PVector();
    this.storageSize = storageSize>0 ? storageSize : 1;
  }
  void setAngle(float angle) {
    this.angle = angle;
  }
  void setPosition(float x, float y) {
    this.position.x = x;
    this.position.y = y;
  }
  void setPosition(PVector position) {
    this.position = position.copy();
  }
  boolean hasStorageSpace() {
    if (this.storage.size() < this.storageSize) {
      return true;
    }
    return false;
  }
  void setOutput(TransportLink link) {
    this.output = link;
  }
  
  boolean add(Resource r) {
    if (hasStorageSpace()) {
      this.storage.add(r);
      return true;
    }
    return false;
  }
  PVector getPosition() {
    return this.position.copy();
  }
  void flush() {
    if (storage.size()>0) {
      storage.remove(storage.size() - 1);
    }
  }
}
