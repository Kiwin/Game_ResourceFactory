public abstract class Resource implements Drawable { //<>// //<>// //<>//

  //Resource object representing resources ingame.
  public final ResourceType type;

  //---Position---//
  protected PVector position;             //Position of the Resource object.
  protected PVector position_preffered;   //Preffered position of the Resource object.
  protected PVector position_ease;        //Easing of the Resource object's position to its preffered position.
  protected PVector velocity;             //Velocity of the Resource object.

  protected float angle;                  //Angle of the Resource object.
  protected float angle_preffered;        //Preffered angle of the Resource object.
  protected float angle_ease = 1;         //Easing of the Resource object's angle to its preffered angle.
  protected float angle_velocity;         //Velocity of the Resource objects angle.

  //---Dimensions---//
  protected float scale = 1;              //Scale of the Resource object.
  protected float scale_preffered = 1;    //Preffered scale of the Resource object.
  protected float scale_ease = 1;         //Easing of the Resource object's scale to its preffered scale.

  protected float width;                  //Width of the Resource object.
  protected float width_preffered;        //Preffered width of the Resource object.
  protected float width_ease = 1;         //Easing of the Resource object's width to its preffered width.

  protected float height;                 //Height of the Resource object.
  protected float height_preffered;       //Preffered height of the Resource object.
  protected float height_ease = 1;        //Easing of the Resource object's width to its preffered height.

  protected boolean shape_round = false;  // Shape of the Resource object. TRUE = "Ellipse" and FALSE = "Rectangle".

  public Resource(ResourceType type, float x, float y, float width, float height) {
    this.position = new PVector(x, y);
    this.position_preffered = new PVector(x, y);
    this.position_ease = new PVector(1, 1);
    this.velocity = new PVector();

    this.width = width;
    this.height = height;
    this.width_preffered = width;
    this.height = height;
    this.height_preffered = height;
    this.type = type;
    this.angle = type.ANGLE;
  }

  public void draw() {
    fill(this.type.COLOR);
    noStroke();

    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(radians(this.angle));
    if (!shape_round) {
      rect(0, 0, this.width*scale, this.height*scale);
    } else {
      ellipse(0, 0, this.width*scale, this.height*scale);
    }
    popMatrix();
  }

  public void update() {
    updateSize();
    updateAngle();
    updatePosition();
  }

  protected void updateSize() {
    //Update width
    if (width_ease != 1) {
      width += (width_preffered - width)*width_ease;
    } else if (width != width_preffered) {
      width = width_preffered;
    }
    //Update Height
    if (width_ease != 1) {
      width += (width_preffered - width)*width_ease;
    } else if (width != width_preffered) {
      width = width_preffered;
    }
    //Update scale
    if (scale_ease != 1) {
      scale += (scale_preffered - scale)*scale_ease;
    } else if (scale != scale_preffered) {
      scale = scale_preffered;
    }
  }

  protected void updateAngle() {
    //Update angle
    if (angle_ease != 1 && angle_ease != 0) {
      angle += (angle_preffered - angle)*angle_ease;
    } else if (angle_velocity != 0) {
      angle += angle_velocity;
    } else if (angle != angle_preffered) {
      angle = angle_preffered;
    }
  }

  protected void updatePosition() {
    //Update position

    if (this.position_ease.x != 0 && this.position_ease.x != 1) {
      this.position.x += (this.position_preffered.x - this.position.x) * position_ease.x;
    } else {
      this.position.x += + velocity.x;
    }
    if (this.position_ease.y != 0 && this.position_ease.y != 1) {
      this.position.y += (this.position_preffered.y - this.position.y) * position_ease.y;
    } else {
      this.position.y += + velocity.y;
    }
  }

  public void setPosition(float x, float y) {
    this.position_preffered.x = x;
    this.position_preffered.y = y;
  }

  public void setPosition(PVector position) {
    this.position_preffered = position.copy();
  }

  public void setPositionEaseX(float ease) {
    this.position_ease.x = ease;
  }

  public void setPositionEaseY(float ease) {
    this.position_ease.y = ease;
  }

  public void setPositionEase(float x, float y) {
    this.position_ease.x = x;
    this.position_ease.y = y;
  }

  public void setPositionEase(PVector ease) {
    this.position_ease = ease;
  }

  public float getPositionEaseX() {
    return this.position_ease.x;
  }

  public float getPositionEaseY() {
    return this.position_ease.y;
  }

  public PVector getPositionEase() {
    return this.position_ease.copy();
  }

  public PVector getPosition() {
    return this.position.copy();
  }

  public void setVelocity(float x, float y) {
    this.velocity.x = x;
    this.velocity.y = y;
  }

  public void setVelocity(PVector velocity) {
    this.velocity = velocity.copy();
  }

  public PVector getVelocity() {
    return this.velocity.copy();
  }

  public void setAngle(float angle) {
    this.angle_preffered = angle;
  }
  public void setAngle(float angle, float ease) {
    this.angle_preffered = angle;
    this.angle_ease = ease;
  }

  public void setAngleEase(float ease) {
    this.angle_ease = ease;
  }

  public float getAngle() {
    return this.angle;
  }

  public void setWidth(float width) {
    this.width_preffered = width;
  }

  public float getWidth() {
    return this.width;
  }

  public void setWidthEase(float width_ease) {
    this.width_ease = width_ease;
  }

  public void setHeight(float height) {
    this.height_preffered = height;
  }

  public float getHeight() {
    return this.height;
  }

  public void setHeightEase(float height_ease) {
    this.height_ease = height_ease;
  }

  public void setSize(float size) {
    this.width_preffered = size;
    this.height_preffered = size;
  }

  public void setSize(float width, float height) {
    this.width_preffered = width;
    this.height_preffered = height;
  }

  public void setSizeEase(float ease) {
    this.width_ease = ease;
    this.height_ease = ease;
  }

  public void setSizeEase(float width_ease, float height_ease) {
    this.width_ease = width_ease;
    this.height_ease = height_ease;
  }
  public void setScale(float scale) {
    this.scale_preffered = scale;
  }

  public void setScaleEase(float ease) {
    this.scale_ease = ease;
  }

  public float getScale() {
    return this.scale;
  }
}