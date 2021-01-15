class CarSystem {
    //CarSystem - 
    //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

    ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();
    ArrayList<CarController> newCarControllerList = new ArrayList<CarController>();

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
        for (int i = 0; i < CarControllerList.size(); i++) {    
            // if(CarControllerList.get(i).bil.pointsPassed = CarControllerList.get(i).bil.pointsPassed){
            NeuralNetwork referenceHjerne = CarControllerList.get(i).hjerne;
            Car referenceBil= CarControllerList.get(i).bil;
            //    Car referenceHjerne= CarControllerList.get(i).hjerne.DNA;

            if (millis() > referenceBil.time + 5000) {
                if (referenceBil.pointsPassedTemp >= referenceBil.pointsPassed) {
                    referenceBil.vel.mult(0);
                }
                referenceBil.pointsPassedTemp = referenceBil.pointsPassed;
                referenceBil.time = millis();
            }

            if (referenceBil.pointsPassed ==punkter.size()) {
                for (int j = 0; j < CarControllerList.size(); j++) {
                    CarControllerList.get(j).bil.vel.mult(0);
                }
                mutation();
            } 
            if (referenceBil.pointsPassed >= pointsPassedRecord) {
                pointsPassedRecord = referenceBil.pointsPassed;
                //   println("record"+pointsPassedRecord);
                //
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
                    mutation();
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
        newCarControllerList = CarControllerList;
        for (int i = 0; i < carSystem.CarControllerList.size(); i++) { 
            print(CarControllerList);

            Car referenceBil = carSystem.newCarControllerList.get(i).bil;
            NeuralNetwork referenceHjerne = carSystem.newCarControllerList.get(i).hjerne;
            if (referenceBil.pointsPassed == carSystem.pointsPassedRecord) {
                for (int j = 0; j < referenceHjerne.weights.length; j++) {
                    if (random(1, 10)<1) {
                        referenceHjerne.weights[j]+=random(-0.05, 0.05);
                    }
                }
                for (int j = 0; j < referenceHjerne.biases.length; j++) {
                    if (random(1, 10)<1) {
                        referenceHjerne.weights[j]+=random(-0.05, 0.05);
                    }
                }


                //newCarControllerList.get(i).hjerne.weights =  referenceHjerne.weights;
                //newCarControllerList.get(i).hjerne.biases =  referenceHjerne.biases;

                CarControllerList.clear();
                CarControllerList = newCarControllerList;
               ;
            }
        }
    }
}
