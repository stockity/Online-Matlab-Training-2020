clear;clc;
% Optimization on TLBO for MRR1
figure;
FitnessFunction=@MRR1_Ra1;
lowerBound=[70 30 100]; 
upperBound=[190 450 600]; 
[bestFitness,bestSol]=TLBO_OPT(FitnessFunction,lowerBound,upperBound);
bestFitness=-bestFitness
bestSol=bestSol

%%  Optimization on TLBO for MRR2
figure;
FitnessFunction=@MRR2_fit;
lowerBound=[70 30 100]; 
upperBound=[190 450 600]; 
[bestFitness,bestSol]=TLBO_OPT(FitnessFunction,lowerBound,upperBound);
bestFitness=-bestFitness
bestSol=bestSol
% %%  Optimization on TLBO for MRR3
% figure;
% FitnessFunction=@MRR3_fit;
% lowerBound=[70 30 100]; 
% upperBound=[190 450 600]; 
% [bestFitness,bestSol]=TLBO_OPT(FitnessFunction,lowerBound,upperBound);
% bestFitness=-bestFitness
% bestSol=bestSol