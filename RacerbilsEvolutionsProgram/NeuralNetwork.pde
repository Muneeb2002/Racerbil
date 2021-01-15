class NeuralNetwork {
    //All weights
    float[] weights = {-0.7928207, -1.6719971, 1.0088239, -0.30102015, -1.2492614, 1.8352888, -0.29741096, 0};//new float[8];


    //Naming convention w{layer number}_{from neuron number}_{to neuron number}
    // layer 1, 2 hidden neurons: w0_11=w[0], w0_21=w[1], w0_31=w[2] 
    //                            w0_12=w[3], w0_22=w[4], w0_32=w[5]
    // layer 2, 1 output neuron : w1_11=w[6], w1_21=w[7] 

    //All biases
    float[] biases = {0.74258566, -1.5084612, 0};//new float[3];
    float[] DNA = new float[weights.length+biases.length] ;
    float f = 0;
    //Naming convention b{layer number}_{neuron number}
    // layer 1, 2 hidden neurons: b2_1=b[0], b2_2=b[1]
    // layer 2, 1 output neuron : b3_1=b[2]

    NeuralNetwork(float varians) {
        for (int i=0; i < weights.length -1; i++) {
            weights[i] += random(-varians, varians);
        }

        for (int i=0; i < biases.length -1; i++) {
            biases[i] += random(-varians, varians);
        }   
        DNA = concat(weights, biases);
        // println(DNA);
    }

    NeuralNetwork mutation() {
        NeuralNetwork newNeuralNetwork = new NeuralNetwork(2);
       
        
        return newNeuralNetwork;
    }



    float getOutput(float x1, float x2, float x3) {
        //layer1
        float o11 = weights[0]*x1+ weights[1]*x2 + weights[2]*x3 + biases[0];
        float o12 = weights[3]*x1+ weights[4]*x2 + weights[5]*x3 + biases[1];
        //layer2
        return o11*weights[6] + o12*weights[7] + biases[2];
    }
}
