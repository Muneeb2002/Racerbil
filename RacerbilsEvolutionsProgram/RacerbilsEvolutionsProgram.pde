int x;
int y;
int d = 0;
//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 2;    
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
}

void draw() {
    clear();
    image(trackImage, 0, 0);  

    lines();
    carSystem.updateAndDisplay();
 
if (d == 0){    
    println(carSystem.CarControllerList.get(0).hjerne.weights);
    println();
    println(carSystem.CarControllerList.get(0).hjerne.biases);
    d++;
}

    //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
   /* for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        if (s.whiteSensorFrameCount > 0) {
            carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
        }
    }*/
    //
    for (int i = 0; i < punkter.size(); i++) {
        noStroke();
        fill(255, 20, 147);
        ellipse(punkter.get(i).x, punkter.get(i).y, 10, 10);
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
