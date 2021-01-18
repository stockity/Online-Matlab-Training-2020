clc;clear;           % clear the command screen and ram data

%% Problem Settings
lb= [-pi -pi] ;         % set lower bound limit of variables   
ub=[pi pi];         % Set Upper bound limit of variables
prob = @CostFunction ;    % call the fitness function

%% Algorithm Parameters
Np=50  ;           % number of population
T= 50 ;            % Number of Iteration
 
%%  Starting the TLBO
f = NaN(Np,1);      % Array to hold solution(fitness score) for polution
BestFitIter = NaN(T+1,1);   % Vector to store best fitness value in every iteration

D=length(lb);       % to know number of variables

P=repmat(lb,Np,1)+repmat((ub-lb),Np,1).*rand(Np,D); % Initialize Population with random number between lb and Ub

for p = 1:Np
    f(p)=prob(P(p,:));  % Evaluate Fitness score for Population
end

BestFitIter(1)=min(f);
%% Iteration Loop
for t=1:T
    
    for i=1:Np
        %% Teacher Phase
        Xmean = mean(P) ;   %Determine mean of the Population
        
        [v,ind]=min(f)  ;   %Determine the location of Teacher
        Xbest = P(ind,:)  ; %Copying the location of teacher
        
        TF=randi([1,2],1,1);   % Generate either 1 or 2 randomly for Teaching Factor
        
        Xnew = P(i,:) + rand(1,D).*(Xbest-TF*Xmean); % Generate the New Solution Variable
        
        Xnew = min(ub,Xnew) ;   %Bound the Violating Variable to their upper limit
        Xnew =max(lb,Xnew) ;    %Bound the Violating Variable to their lower limit
        
        fnew =prob(Xnew) ;      %Evaluating the fitness of the newly generated variable set
        
        if(fnew < f(i))         %Greedy Selection / Best population updater
            P(i,:) = Xnew  ;   % Include new solution set to polulation
            f(i) =fnew        %Include the Fitness Function Value
        end
        
        %% Learner Phase
        
        p=randi([1,Np],1,1) ;   % Selection of random partner from population
        
        %% Ensuring that the current member is not the partner        
        while i==p
           p=randi([1,Np],1,1)  ;  % till it get new random partner
        end
        
        if f(i)<f(p)        %Select appropriate equation to be used in Learner Phase
            Xnew = P(i,:) +rand(1,D).*(P(i,:)-P(p,:)); % Generate the new solution set
        else
            Xnew = P(i,:)- rand(1,D).*(P(i,:)-P(p,:)) ;% Generate the new solution set
        end
        
        Xnew = min(ub,Xnew) ;   %Bound the Violating Variable to their upper limit
        Xnew =max(lb,Xnew)  ;   %Bound the Violating Variable to their lower limit
        
        fnew =prob(Xnew)  ;    %Evaluating the fitness of the newly generated variable set
        
        if(fnew < f(i))         %Greedy Selection / Best population updater
            P(i,:) = Xnew  ;    % Include new solution set to polulation
            f(i) =fnew  ;       %Include the Fitness Function Value
        end
    end
    BestFitIter(t+1)=min(f) ;   % store best fitness in every iteration 
    
    disp(['Iteration ' num2str(t) ': Best Fitness =' num2str(BestFitIter(t+1))]);
end
[bestFitness,ind] = min(f);
bestSol = P(ind,:)

subplot(1,2,1)
plot(0:T,BestFitIter)

subplot(1,2,2)
semilogy(0:T,BestFitIter)




