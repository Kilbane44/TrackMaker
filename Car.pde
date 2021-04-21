class Car extends Particle
{
  PVector accel;
  PVector vel;
  PVector dir;

  float angle;

  Car()
  {
    
    pos = new PVector(width/2, height/2);
    rays = new ArrayList<Ray>();
    
    accel = new PVector(0,0);
    vel = new PVector(0,0);
   
    angle = 0;
     dir = PVector.fromAngle(angle);

    for (float i=0; i < 360; i+=15)
    {
      rays.add(new Ray(pos, radians(i)));
    }
  }
  
  
  void Move()
  {
    dir = PVector.fromAngle(angle);
    dir.normalize();
    println(dir);
    pos.add(dir);
    UpdatePos();
    
  }
  
}
