//Code from https://www.youtube.com/watch?v=K7uES46uqEA&list=WL&index=4&t=28s
//To test how works processing.org

void setup(){
    size(1000, 1000);
}

float c = 0.5;
float mathf(float x){
    return x * c;
}

float radius = 300;
int divisions = 150;
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
}
