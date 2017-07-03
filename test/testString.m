%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试MATLAB家里面的字符串使用 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


StartSweepFreq = 1;
EndSweepFreq = 10;
SweepName = ['Fast' num2str(StartSweepFreq) 'to' num2str(EndSweepFreq) 'GHz'];
disp(SweepName);

SetupFreq = 8.34;
SetupFreqName = num2str(SetupFreq);
SetupFreqName = strrep(SetupFreqName, '.', '_');
disp(SetupFreqName);