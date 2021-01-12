class Car {  
    //Bil - indeholder position & hastighed & "tegning"

    PVector pos = new PVector(580, 150);
    PVector vel = new PVector(0, 5);
    float dist; 
    int removed =0;
    int pointsPassed=0;

    void turnCar(float turnAngle) {
        vel.rotate(turnAngle);
    }

    void displayCar() {
        stroke(100);
        fill(100);
        
        ellipse(pos.x, pos.y, 10, 10);
    }

    void update() {
        pos.add(vel);
        for (int i = 0; i < punkter.size(); i++) {
            dist = dist(pos.x, pos.y, punkter.get(i).x, punkter.get(i).y);


            if (dist<70) {
                pointsPassed = i+1;
            }
        }
        //print(pointsPassed);


        for (int i = 0; i < populationSize; i++) {
            dist= dist(pos.x, pos.y, punkter.get(12).x, punkter.get(12).y); 
            if (dist<100 && pointsPassed < 10) { 
                /*pos.x=10000;
                 pos.y=10000;
                 vel.x = 0;
                 vel.y = 0;
                 pointsPassed = 0;*/
            }
        }
    }
}
