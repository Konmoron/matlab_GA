function mypow()
%FIND 此处显示有关此函数的摘要
%   此处显示详细说明
clc;
clear;
close all;
options = gaoptimset('PopulationType','bitString'); %设置成bitString的方式
options = gaoptimset(options,'PlotFcns',{@gaplotbestf,@gaplotscores,@gaplotbestindiv,@gaplotstopping});
FitnessFcn = @findpow;
GenomeLength = 2; % 32 bit representation (might have to increase
[x,fval,exitflag,output] = ga(FitnessFcn,GenomeLength,options)
end