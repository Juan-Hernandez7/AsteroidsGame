public class Asteroid extends Floater
{ 
	private int spin;
	public Asteroid()
	{    
		corners=8;
		int[] xS={6,2,0,-4,-6,-5,4,1};
		int[] yS={2,4,7,5,2,-2,-3,0};
	xCorners = xS;
  yCorners = yS;
  myCenterX= 500;
  myCenterY=500;
  myPointDirection=0;
  myDirectionX=0;
  myDirectionY=0;
  myColor=255;
  spin=(int)(Math.random()*11)-5;
	}
	public void move()
	{
		roids.rotate(spin);
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