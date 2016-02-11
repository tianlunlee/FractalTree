private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	   
	line(320,480,320,380);   
	drawBranches(320, 380, 100, 3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here  
	double angle1, angle2, bL;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	bL = branchLength;
	bL *= fractionLength;
	int endX1, endX2, endY1, endY2;
	endX1 = (int)(bL*Math.cos(angle1) + x);
	endY1 = (int)(bL*Math.sin(angle1) + y);
	endX2 = (int)(bL*Math.cos(angle2) + x);
	endY2 = (int)(bL*Math.sin(angle2) + y);
	stroke((int)(bL),255,y);
	line(x, y, endX1, endY1);
	line(x,y, endX2, endY2);

	if(branchLength <= 20) {
		fill(255, 50, 0);
		ellipse(endX1, endY1, 3,3);
		ellipse(endX2, endY2, 3,3);

	}
	else{
		drawBranches(endX1, endY1, bL, angle1);
		drawBranches(endX2, endY2, bL, angle2);
		
	}
} 
