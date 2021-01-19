function score = CostFunction(t)

% 2 variables : [ t(1) t(2) ]

 
score=( 3*(1-t(1)).^2.*exp(-(t(1).^2) - (t(2)+1).^2) ... 
   - 10*(t(1)/5 - t(1).^3 - t(2).^5).*exp(-t(1).^2-t(2).^2) ... 
   - 1/3*exp(-(t(1)+1).^2 - t(2).^2) )
end

