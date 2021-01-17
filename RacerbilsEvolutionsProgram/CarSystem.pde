class CarSystem {
    //CarSystem - 
    //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser
    CarController BestCar;
    ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();


    int pointsPassedRecord = 0;

    CarSystem(int populationSize) {
        for (int i=0; i<populationSize; i++) { 
            CarController controller = new CarController();
            CarControllerList.add(controller);
        }
    }




    void updateAndDisplay() {
        //1.) Opdaterer sensorer og bilpositioner
        for (CarController controller : CarControllerList) {
            controller.update();
        }

        //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
        for (CarController controller : CarControllerList) {
            controller.display();
        }
        fitness();
    }

    void fitness() {


        /*   
         */



        for (int i = 0; i < CarControllerList.size(); i++) {    
            // if(CarControllerList.get(i).bil.pointsPassed = CarControllerList.get(i).bil.pointsPassed){
            Car referenceBil= CarControllerList.get(i).bil;
            //    Car referenceHjerne= CarControllerList.get(i).hjerne.DNA;

            if (millis() > referenceBil.time + 5000) {
                if (referenceBil.pointsPassedTemp >= referenceBil.pointsPassed) {
                    referenceBil.vel.mult(0);
                }
                referenceBil.pointsPassedTemp = referenceBil.pointsPassed;
                referenceBil.time = millis();
            }
            boolean isFinished = false;
           /* circle(mouseX, mouseY, 100);
            if (dist(mouseX, mouseY, referenceBil.pos.x, referenceBil.pos.y)<100) {
                referenceBil.vel.mult(0);
            }*/
            if (referenceBil.pointsPassed ==punkter.size()) {
                for (int j = 0; j < CarControllerList.size(); j++) {
                    CarControllerList.get(j).bil.vel.mult(0);
                }

                isFinished = true;
                BestCar = CarControllerList.get(i);
            } 
            if (isFinished) {
                if (lapTime > generationTime) {
                    lapTime = generationTime;
                }
                mutation();
            }
            if (referenceBil.pointsPassed >= pointsPassedRecord) {
                pointsPassedRecord = referenceBil.pointsPassed;
            }
            boolean allCarsStopped = true;
            for (int j = 0; j < CarControllerList.size(); j++) {
                if (CarControllerList.get(j).bil.vel.x != 0 && CarControllerList.get(j).bil.vel.y != 0) {
                    allCarsStopped = false;
                    break;
                }
            }

            if (allCarsStopped) {
                if (referenceBil.pointsPassed == pointsPassedRecord) {
                    if (isFinished == false) {
                        BestCar = CarControllerList.get(i);
                        mutation();
                       // allCarsStopped = true;
                    }
                } else {  
                    for (int j = 0; j<carSystem.CarControllerList.size(); j++) {
                        if (passed == false) {
                            //for(int j = 0;j<punkter.size();){
                            float distance = dist(punkter.get(0).x, punkter.get(0).y, carSystem.CarControllerList.get(j).bil.pos.x, carSystem.CarControllerList.get(j).bil.pos.y);
                            //if()
                            if (distance < recordDist) {
                                recordDist = distance;
                            }
                        }
                    }
                    for (int j = 0; j<carSystem.CarControllerList.size(); j++) {
                        float distance = dist(punkter.get(0).x, punkter.get(0).y, carSystem.CarControllerList.get(j).bil.pos.x, carSystem.CarControllerList.get(j).bil.pos.y);
                        //if()
                        if (distance == recordDist) {
                            BestCar = CarControllerList.get(j);
                            recordDist = 100;
                            mutation();
                           // allCarsStopped = true;
                        }
                    }
                }
            }
        }



        for (int i = 0; i < CarControllerList.size(); i++) { //fjerner biler der går bag mål stregen
            Car reference= CarControllerList.get(i).bil;
            float dist= dist(reference.pos.x, reference.pos.y, punkter.get(12).x, punkter.get(12).y); 
            if (dist<100 && reference.pointsPassed < 10) { 
                CarControllerList.get(i).bil.vel.mult(0);
            }
        }
    }

    void mutation() {
        CarControllerList.clear();
        int random = (int)random(0, populationSize);
        // println(random);
        for (int i = 0; i < populationSize; i++) {
            CarController controller = new CarController();
            /* if (i == random) {
             for (int j = 0; j < BestCar.hjerne.weights.length; j++) {  
             BestCar.hjerne.weights[j]=random(-2, 2);
             
             controller.hjerne.weights[j]=BestCar.hjerne.weights[j];
             }
             for (int j = 0; j < BestCar.hjerne.biases.length; j++) {  
             BestCar.hjerne.biases[j]=random(-2, 2);
             controller.hjerne.biases[j]=BestCar.hjerne.biases[j];
             }
             } else {*/
            for (int j = 0; j < BestCar.hjerne.weights.length; j++) {  
                if (random(0, 100)<1) {
                    BestCar.hjerne.weights[j]+=random(random(0, -0.1), random(0, 0.1));
                }
                controller.hjerne.weights[j]=BestCar.hjerne.weights[j];
            }
            for (int j = 0; j < BestCar.hjerne.biases.length; j++) {  
                if (random(0, 100)<1) {
                    BestCar.hjerne.biases[j]+=random(random(0, -0.1), random(0, 0.1));
                }
                controller.hjerne.biases[j]=BestCar.hjerne.biases[j];
                //}
            }

            CarControllerList.add(controller);
        }
        println("Generation " + generationCounter + "'s fastest lap time was " + nf(generationTime,0,4) + " seconds");
        generationCounter++;
        lastLapTime = generationTime;
        generationTime = 0;
        passed = false;
    }
}
