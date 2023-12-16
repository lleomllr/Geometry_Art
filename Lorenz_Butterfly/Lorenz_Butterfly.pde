import peasy.*; 
PeasyCam camera; 

float x = 0.01; 
float y = 0; 
float z = 0; 

float prandtl = 10; 
float ray = 28; 
float beta = 8.0/3.0; 

ArrayList<PVector> points = new ArrayList<PVector>(); 


void setup() {
  size(1000, 1000, P3D); 
  colorMode(HSB); 
  camera = new PeasyCam(this, 600);  
}

void draw() {
  float dt = 0.01;
  float dx = (prandtl * (y - x))*dt; 
  float dy = (x * (ray - z) - y)*dt; 
  float dz = (x * y - beta * z)*dt; 
  
  x = x + dx; 
  y = y + dy; 
  z = z + dz; 
  
  points.add(new PVector(x, y, z)); 
  
  background(0); 
  translate(0, 0, -80);
  //float camX = map(mouseX, 0, width, -200, 200);
  //float camY = map(mouseY, 0, height, -200, 200);
  //camera(camX, camY, (height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, 1, 0);
  
  scale(5); 
  stroke(255);
  noFill(); 
  
  float hu = 0;
  
  beginShape(); 
  
  for (PVector v : points) {
    stroke(hu, 255, 255); 
    vertex(v.x, v.y, v.z);
    
    hu += 0.1; 
    if(hu > 255) {
      hu = 0; 
    }
   
  }
  endShape(); 
}
