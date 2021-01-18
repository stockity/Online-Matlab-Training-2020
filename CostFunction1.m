function score = CostFunction1(t)

%  [x y] = meshgrid(-pi:.1:pi);

 
score=  3*(1-t(1)).^2.*exp(-(t(1).^2) - (t(2)+1).^2) ... 
   - 10*(t(1)/5 - t(1).^3 - t(2).^5).*exp(-t(1).^2-t(2).^2) ... 
   - 1/3*exp(-(t(1)+1).^2 - t(2).^2) 
end

