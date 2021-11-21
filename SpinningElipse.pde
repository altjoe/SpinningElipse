
Recording record;
void setup() {
    size(1080, 1080);
    background(255);
    smooth();

    record = new Recording();
    record.start();
}
float angle = 0;
void draw() {
    // background(255);

    // noStroke();
    fill(255, 10);
    rect(-5, -5, width+5, height+5);

    translate(width/2, height/2);
    rotate(radians(angle));
    
    EllRotate test1 = new EllRotate(2);
    EllRotate test2 = new EllRotate(3);
    EllRotate test3 = new EllRotate(5);
    EllRotate test4 = new EllRotate(7);
    EllRotate test5 = new EllRotate(10);

    test1.display();
    test2.display();
    test3.display();
    test4.display();
    test5.display();
    filter(BLUR, 1);
    angle += 0.5;
    record.control();
}

class EllRotate{
    float s;
    public EllRotate(float size){
        s = size;
    }

    void display(){
        pushMatrix();
        translate(-40*s, 0);
        pushMatrix();
        rotate(radians(angle*4));
        noFill();
        // rect(0, 0, 50*s, 25*s);
        strokeWeight(3);
        ellipse(0, 0, 100*s, 50*s);
        popMatrix();
        popMatrix();
    }
}

class Recording {
    boolean recording = false;
    boolean stopped = false;
    int start_frame;
    int stop_frame;
    int frame_rate = 30;
    int recording_time = 120;

    public Recording() {
        
    }

    void start(){
        if (recording == false && stopped == false) {
                recording = true;
                start_frame = frameCount;
                stop_frame = start_frame + (frame_rate * recording_time);
        }
    }

    void control(){
        if (recording) {
            saveFrame("output/img-####.png");
            if (stop_frame < frameCount) {
                stopped = true;
                recording = false;
            }
            print(stop_frame, frameCount, '\n');
            if (stopped) {
                println("Finished.");
                System.exit(0);
            }
        }
    }
}