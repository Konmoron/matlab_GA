function testGA()
clc
options = gaoptimset('PopulationType','bitString'); 
options = gaoptimset(options,'PlotFcns',{@gaplotscores,@gaplotrange});
FitnessFcn = @my_fun;
GenomeLength = 2;
[x,fval,exitflag,output] = ga(FitnessFcn,GenomeLength,options)

% ---- ÊÊÓ¦¶Èº¯Êý
function  z = my_fun(x)
z = x(1)^2 - 2*x(1)*x(2) + 6*x(1) + x(2)^2 - 6*x(2);