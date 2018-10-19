class SizerPipe extends TransportLink {
   ResourceType resourceType;

  int triggerSize;

  SizerPipe(Container startPoint, Container endPoint, int triggerSize) {
    super(3, 0.5, 3, startPoint, endPoint);
    this.triggerSize = triggerSize;
    c = color(#ff00ff, 50);
  }

  @Override
    void extract() {
    if (startPoint.storage.size() >= triggerSize) {
      super.extract();
    }
  }
}