 SpaceShip clarence = new SpaceShip();
 Stars [] dots = new Stars [200];
 ArrayList <Asteroid> roids = new ArrayList <Asteroid>();
ArrayList <Bullets> joe= new ArrayList <Bullets>();//your variable declarations here
public void setup() 
{ 
   size(1000,1000);//your code here
 for(int i=0; i<dots.length; i++)
  {  dots[i]= new Stars();}
for(int nI=0; nI<20;nI++)
    {roids.add(new Asteroid());}
}

private float  tooClose;
public void draw() 
{  
  background(0);

   for(int i=0; i<dots.length; i++)
  {dots[i].show();}
for(int nI=0; nI<roids.size();nI++)
    {
      roids.get(nI).show();
      roids.get(nI).move();
    }
    for(int i=0; i<joe.size(); i++)
    {
       joe.get(i).show();
  joe.get(i).move();
    }

    for(int i=0; i<roids.size();i++)
    {
      tooClose = dist(clarence.getX(), clarence.getY(),roids.get(i).getX(),roids.get(i).getY());
   if(tooClose<=20)
    {
      roids.remove(i);
     roids.add(new Asteroid());
    }
  }
  clarence.show();
  clarence.move();
  for(int nI=0; nI<roids.size();nI++)
  {
for(int i=0; i<joe.size(); i++)
{
 
  if(dist(joe.get(i).getX(), joe.get(i).getY(), roids.get(nI).getX(), roids.get(nI).getY()) < 30) 
      { 

        roids.remove(nI); 
        joe.remove(i); 
       break; 
      } 
}
}
}

 public void keyPressed()
 {
  
    if(keyCode == RIGHT) 
      {clarence.rotate(24);}       
     else if(keyCode==LEFT)
     {clarence.rotate(-24);}   
   else if (keyCode==UP)
    {clarence.accelerate(.4);}
    else if (keyCode==DOWN)
      {
        clarence.setY((int)(Math.random()*900));
        clarence.setX((int)(Math.random()*900));
        clarence.setDirectionX(0);
        clarence.setDirectionY(0);
        clarence.setPointDirection((int)(Math.random()*360));
      }
      else if(keyCode=='Q')
      {
          joe.add(new Bullets(clarence));
      }

 }



 public class Stars
 { 
  private int theX,theY;
  public Stars()
  {
    theX=((int)(Math.random()*1000));
    theY=((int)(Math.random()*1000));
  }
  public void show ()
  {
    ellipse(theX,theY,5,5);
  }
 }

public class SpaceShip extends Floater  
{  
 public SpaceShip()
 {  
  corners = 4;
  xCorners = new int[corners];
  yCorners = new int [corners];
xCorners[0]=10;
yCorners[0]=0;
xCorners[1]=-16;
yCorners[1]=-20;
xCorners[2]= -10;
yCorners[2]=0;
xCorners[3]=-16;
yCorners[3]=20;
  myCenterX=500;
  myCenterY=500;
  myPointDirection=0;
  myDirectionX=0;
  myDirectionY=0;
  myColor=255;
  }
   public void setX(int x){ myCenterX=x;} 
   public int getX(){return (int) myCenterX;}  
   public void setY(int y){myCenterY=y;}  
   public int getY(){return (int) myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return (double)myDirectionX;}   
   public void setDirectionY(double y){ myDirectionY=y;}   
   public double getDirectionY(){return (double) myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}   
   public double getPointDirection(){return (int) myPointDirection;} 


}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3  used 
  protected int[] xCorners; //done   
  protected int[] yCorners;  //done 
  protected int myColor; //done  
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()  
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY  //move the floater in the current direction of travel   
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

