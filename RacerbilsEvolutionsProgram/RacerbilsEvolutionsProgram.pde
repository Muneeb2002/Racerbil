

int x;
int y;
float generationTime = 0;
float lapTime = 1000;
float lastLapTime = 0;
int generationCounter = 1;

int framerate = 60;
boolean d, passed;
float recordDist = 100; 
//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100;    
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
    textSize(20);
    fill(0);
    text("The Current Generation is: "+generationCounter, 20, 20);
    if (lapTime == 1000) {
        text("The fastest lap time is: N/A", 20, 110);
    } else {
        text("The fastest lap time is: "+ lapTime + " seconds", 20, 110);
    }
    text("The Current Generation time is: "+nf(generationTime, 0, 3) + " seconds", 20, 50);
    if (generationCounter == 1) {
        text("The last lap time was: N/A", 20, 80);
    } else {
        text("The last lap time was: "+lastLapTime + " seconds", 20, 80);
    }

    lines();
    carSystem.updateAndDisplay(); 



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
    generationTime+=1/frameRate;
}

void lines() {
    fill(255, 0, 0);
}
