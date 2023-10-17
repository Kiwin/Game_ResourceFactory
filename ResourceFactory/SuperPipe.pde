class SuperPipe extends TransportLink {
  SuperPipe(Container startPoint,Container endPoint) {
    super(5,0.2,3, startPoint,endPoint);
    c = color(#ff6666,50);
  }
}