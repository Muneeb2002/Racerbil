class Car {  
    //Bil - indeholder position & hastighed & "tegning"
    int time = millis();
    PVector pos = new PVector(580, 150);
    PVector vel = new PVector(0, 5);
    float dist; 
    int removed =0;
    int pointsPassed = 0;
    int pointsPassedTemp = 0;
    
    

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
            if (i != punkter.size()) { 
                dist = dist(pos.x, pos.y, punkter.get(i).x, punkter.get(i).y);


                if (dist<40) {
                    if (pointsPassed == i) {
                        if (pointsPassed <punkter.size()) {

                            pointsPassed = i+1;
                            passed = true;
                         
                        }
                        //println(pointsPassed);
                    }
                }
            }
        }
    }
}
