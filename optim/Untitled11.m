clear;clc;
FitnessFunction=@MRR3_fit;
lowerBound=[70 30 100]; 
upperBound=[190 450 600]; 
[bestFitness,bestSol]=TLBO_OPT(FitnessFunction,lowerBound,upperBound);
bestFitness=-bestFitness
bestSol=bestSol