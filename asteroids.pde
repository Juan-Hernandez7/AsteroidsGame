public class Asteroid extends Floater
{ 
	private int spin;
	public Asteroid()
	{    
		corners=8;
		int[] xS={10,12,0,-9,-6,-13,14,7};
		int[] yS={2,18,17,6,12,-5,-3,7};
	xCorners = new int[corners];
  yCorners = new int [corners];
	xCorners = xS;
  yCorners = yS;
  myCenterX= (int)(Math.random()*1000);
  myCenterY=(int)(Math.random()*1000);
  myPointDirection=0;
  myDirectionX=2;
  myDirectionY=3;
  myColor=255;
  spin=(int)(Math.random()*11)-5;
	}
	public void move()
	{
		rotate(spin);
	 super.move();
   
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