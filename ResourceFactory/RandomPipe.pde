class RandomPipe extends TransportLink {
  RandomPipe(Container startPoint, Container endPoint) {
    super(4.5, 0.5, 2, startPoint, endPoint);
    c = color(#ffaaaa, 50);
  }
  
  @Override
   void extract() {
    Resource item = startPoint.storage.get((int)random(startPoint.storage.size()-1));
     super.extract();
  }
}