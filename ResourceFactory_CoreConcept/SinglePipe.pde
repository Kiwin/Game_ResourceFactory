class SinglePipe extends TransportLink {
  SinglePipe(Container startPoint,Container endPoint) {
    super(10,1,1, startPoint,endPoint);
    c = color(#2222ff,50);
  }
}