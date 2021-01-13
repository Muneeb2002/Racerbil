class CarSystem {
    //CarSystem - 
    //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

    ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();

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

            Car referenceBil= CarControllerList.get(i).bil;
            //    Car referenceHjerne= CarControllerList.get(i).hjerne.DNA;

            if (millis() > referenceBil.time + 5000) {
                if (referenceBil.pointsPassedTemp >= referenceBil.pointsPassed) {
                    CarControllerList.remove(CarControllerList.get(i));
                }
                referenceBil.pointsPassedTemp = referenceBil.pointsPassed;
                referenceBil.time = millis();
            }

            if (referenceBil.pointsPassed ==punkter.size()) {
                println(CarControllerList.get(i).hjerne.DNA);
            }
        }

        for (int i = 0; i < CarControllerList.size(); i++) { //fjerner biler der går bag mål stregen
            Car reference= CarControllerList.get(i).bil;
            float dist= dist(reference.pos.x, reference.pos.y, punkter.get(12).x, punkter.get(12).y); 
            if (dist<100 && reference.pointsPassed < 10) { 
                CarControllerList.remove(CarControllerList.get(i));
            }
        }
    }
}
