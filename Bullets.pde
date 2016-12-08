class Bullets extends Floater
{
	public Bullets(SpaceShip theShip)
	{
		
		 myCenterX=theShip.getX();
  myCenterY= theShip.getY();
  myPointDirection= theShip.getPointDirection();
  double dRadians=myPointDirection*(Math.PI/180); 
  myDirectionX= 5*Math.cos(dRadians)+theShip.getDirectionX();
  myDirectionY= 5*Math.cos(dRadians)+theShip.getDirectionY();
  myColor=255;

	}
	public void show()
	{  
		ellipse((float)myCenterX,(float)myCenterY,10,20);
	
		
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
