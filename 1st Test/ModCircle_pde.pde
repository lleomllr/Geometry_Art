void setup(){
    size(1000, 1000);
}

float c = 1.65;
float mathf(float x){
    return tan(x * c) - pow(c, PI); 
}

float radius = 300;
int divisions = 300;
float divAngle = TWO_PI / divisions;

PVector divPos(float num){
    float x = cos(divAngle*num)*radius;
    float y = sin(divAngle*num)*radius;
    return new PVector(x,y);
}


void draw(){
    background(20);
    translate(width/2, height/2);

    noFill();
    stroke(255);
    circle(0, 0, radius*2);
    for(int i = 0; i < divisions; i++){

        float x = i;
        float y = mathf(x);

        PVector start_pos = divPos(x);
        PVector end_pos = divPos(y);



        line(start_pos.x, start_pos.y, end_pos.x, end_pos.y);
    }
    
    c+=0.01;
    
    if(c > 10)
    {
      c = 0;
    }
}
