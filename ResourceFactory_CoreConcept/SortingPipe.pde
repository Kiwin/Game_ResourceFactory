class SortingPipe extends TransportLink {
  ResourceType resourceType;
  SortingPipe(Container startPoint, Container endPoint, ResourceType type) {
    super(3, 0.5, 1, startPoint, endPoint);
    this.resourceType = type;
    c = color(#55ff55, 50);
  }

  @Override
    void extract() {
    for (int i = 0; i < startPoint.storage.size(); i++) {
      Resource item = startPoint.storage.get(i);
      if (item.type == this.resourceType && this.add(item)) {
        item.setSize(itemSize*0.62);
        startPoint.storage.remove(item);
        break;
      }
    }
  }
}