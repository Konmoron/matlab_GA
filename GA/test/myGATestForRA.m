function myGATestForRA()
%FIND 此处显示有关此函数的摘要
%   此处显示详细说明
clc;
clear;
close all;
options = gaoptimset('PopulationType','bitString'); %设置成bitString的方式
options = gaoptimset(options,'PlotFcns',{@gaplotbestf,@gaplotscores,@gaplotbestindiv,@gaplotstopping});
FitnessFcn = @objFuncOfReconfigurableAntenna; % 目标函数，也就是适应度函数
GenomeLength = 12; % 染色体的长度
[x,fval,exitflag,output] = ga(FitnessFcn,GenomeLength,options)
end

