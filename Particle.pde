class Particle
{
  PVector pos;
  ArrayList<Ray> rays;
  Particle()
  {
    pos = new PVector(width/2, height/2);
    rays = new ArrayList<Ray>();

    for (float i=0; i < 360; i+=2)
    {
      rays.add(new Ray(pos, radians(i)));
    }
  }


  void LookAt(Boundary w)
  {
    for (Ray r : rays)
    {
      PVector pt = r.Cast(wall);

      if (pt.x ==0 && pt.y == 0)
      {
      } else
      {
        fill(255);
        line(pos.x, pos.y, pt.x, pt.y);
        ellipse(pt.x, pt.y, 8, 8);
      }
    }
  }



  void LookAt(ArrayList<Boundary> w)
  {
    for (Ray r : rays)
    {
      PVector closestPt = new PVector(0, 0);
      float closestDistance = 99999;
      for (Boundary wall : w)
      {
        PVector pt = r.Cast(wall);


        if (pt.x ==0 && pt.y == 0)
        {
        } else
        {
          float dToPoint =dist(pos.x, pos.y, pt.x, pt.y);
          if ( dToPoint< closestDistance)
          {
            closestDistance = dToPoint;
            closestPt.x = pt.x;
            closestPt.y = pt.y;
          }
        }
      }

      if (closestPt.x != 0 && closestPt.y !=0)
      {
        fill(255);
        line(pos.x, pos.y, closestPt.x, closestPt.y);
        ellipse(closestPt.x, closestPt.y, 8, 8);
      }
    }
  }

  void Draw()
  {
    fill(255);

    for (Ray r : rays)
    {
      r.Draw();
    }
  }


  void UpdatePos()
  {
    for (Ray r : rays)
    {
      r.SetPos(pos);
    }
  }

  void SetPos(float x, float y)
  {
    pos = new PVector(x, y);
    for (Ray r : rays)
    {
      r.SetPos(pos);
    }
  }
  
  
  void CheckWallCollision(ArrayList<Boundary> w)
  {
    
  }
}
