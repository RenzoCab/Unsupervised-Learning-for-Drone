close all;
clear all;
clc;

num_of_disc  = 20;
inputs       = zeros(num_of_disc,1);
fun          = @(x) main_testing(x,num_of_disc,0);
lb           = zeros(num_of_disc,1);
ub           = ones(num_of_disc,1);

[opt,~,~,output] = fmincon(fun,inputs,[],[],[],[],lb,ub);

main_testing(opt,num_of_disc,1);