abstract class Machine extends Container implements Drawable {

  //Machine object for processing resources.

  float productionCooldown;
  int lastProductionFrame;

  Machine(int storageSize, float productionCooldown) {
    super(storageSize);
    this.productionCooldown = productionCooldown;
    lastProductionFrame = frameCount;
  }

  void update() {
    if (frameCount >= lastProductionFrame + frameRate/updateRate*productionCooldown) {
      if (produce()) {
        lastProductionFrame = frameCount;
      }
    }
  }

  abstract boolean produce();
}