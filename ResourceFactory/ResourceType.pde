enum ResourceType {
  iron(#a5a5a5,0), gold(#CFB53B,0), diamond(#67E6EC,45);
  
  final color COLOR;
  final float ANGLE;
  private ResourceType(color COLOR, float ANGLE){
  this.COLOR = COLOR;
  this.ANGLE = ANGLE;
  }
  
}