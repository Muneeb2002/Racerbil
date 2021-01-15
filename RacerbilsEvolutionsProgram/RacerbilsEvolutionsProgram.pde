

int x;
int y;
int generationTime;
int framerate = 60;

boolean d, passed;
float recordDist = 100; 
//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 20;    
ArrayList <PVector> punkter = new ArrayList<PVector>();

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
    size(1416, 672);
    trackImage = loadImage("track1.png");
    punkter.add(new PVector(430, 160));
    punkter.add(new PVector(330, 175));
    punkter.add(new PVector(220, 260));
    punkter.add(new PVector(200, 315));
    punkter.add(new PVector(230, 380));
    punkter.add(new PVector(280, 420));
    punkter.add(new PVector(385, 470));
    punkter.add(new PVector(740, 475));
    punkter.add(new PVector(1140, 440));
    punkter.add(new PVector(1240, 320));
    punkter.add(new PVector(1220, 240));
    punkter.add(new PVector(1060, 160));
    punkter.add(new PVector(820, 150));
    punkter.add(new PVector(627, 150));
}

void draw() {
    clear();
    frameRate(framerate);
    image(trackImage, 0, 0);  
    lines();
    carSystem.updateAndDisplay();
    checkTarget();   



    //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
    for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        if (s.whiteSensorFrameCount > 0) {
            carSystem.CarControllerList.get(i).bil.vel.mult(0);
        }
    }
    //
    for (int i = 0; i < punkter.size(); i++) {
        noStroke();
        fill(255, 20, 147);
        ellipse(punkter.get(i).x, punkter.get(i).y, 10, 10);
    }
    generationTime++;
}
void checkTarget() {

    for (int i = 0; i<carSystem.CarControllerList.size(); i++) {
        if (passed == false) {
            //for(int j = 0;j<punkter.size();){
            float distance = dist(punkter.get(0).x, punkter.get(0).y, carSystem.CarControllerList.get(i).bil.pos.x, carSystem.CarControllerList.get(i).bil.pos.y);
            //if()
            if (distance < recordDist) {
                recordDist = distance;
            }
        }
    }
}
void lines() {
    fill(255, 0, 0);
    //line(562,120,,);
}



/*
Fitness skal bestå af :
 Whitesensor framecount, 
 hastighed den klarer banen på
 Hvor langt de klarer banen
 
 
 
 */
