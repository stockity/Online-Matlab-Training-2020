function [x,fval,exitflag,output,population,score] = GAMM(nvars,lb,ub)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotscores });
[x,fval,exitflag,output,population,score] = ...
ga(@MRR1_fit,nvars,[],[],[],[],lb,ub,[],[],options);
