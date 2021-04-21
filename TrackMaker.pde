
Boundary wall;
Ray ray;
Particle player;



Car c;
  
PrintWriter output;

PVector newPointA = new PVector(0,0);
PVector newPointB = new PVector(0,0);

ArrayList<Boundary> walls = new ArrayList<Boundary>();


String level = "raceTrack.txt";
void setup()
{
  size(800,800);
 // wall = new Boundary(300,100,300,300);

  //walls.add(wall);
   //walls.add(new Boundary(200,200,150,100));
  player = new Particle();
  
  walls.add(new Boundary(1,1,width,1));
  walls.add(new Boundary(width,0,width,height));
  walls.add(new Boundary(width,height,1,height));
  walls.add(new Boundary(1,height,1,1));
  
  LoadLevel(level);
  
  c = new Car();
  
}

void draw()
{
  background(0);
  
  player.SetPos(mouseX,mouseY);
  //player.Draw();
  
 // c.Draw();
  //c.Move();
 // c.LookAt(walls);
  
  DrawWalls();
  
  //player.LookAt(walls);

  text("right click and drag to draw wall", 50,50);
  text("'C' to clear", 50,80);
  text("'s' to save", 50,80);
  
}

void DrawWalls()
{
  for(Boundary ws: walls)
  {
    ws.Draw();
  }
}



void mousePressed()
{
  if(mouseButton == RIGHT)
  {
    newPointA = new PVector(mouseX,mouseY);
  }
}


void mouseReleased()
{
  if(mouseButton == RIGHT)
  {
    newPointB = new PVector(mouseX, mouseY);
    
    walls.add(new Boundary(newPointA, newPointB));
  }
}


void keyPressed()
{
  if(key == 's')
  {
    output = createWriter("level.txt");
    for(Boundary ws: walls)
    {
      output.println(ws.toString());
    }
    output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
    
  }
  else
  {
    walls.clear();
  }
}



void LoadLevel(String s)
{
  String[] lines = loadStrings(s);
  
  for(int i=0; i < lines.length; i++)
  {
    String[] coords =lines[i].split(" ");
    
    walls.add(new Boundary(Float.parseFloat(coords[0]),Float.parseFloat(coords[1]), Float.parseFloat(coords[2]),Float.parseFloat(coords[3])));
  }
  
}
