%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于储存可重构天线的所有已知参数 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 单位：mm


%% ---- 将所有的变量定义为全局变量：global
    global patchLength centreDistance switchLength switchWidth portDiameter inputDiameter portX portY height substrateLength maxWavelength;
    % ---- 由于此处定义全局变量没有太大的意义，所以放弃定义全局变量，改为普通变量即可
    
    
%% ---- 所有参数
% ---- 正方形金属贴片的边长(patchLength)   9.398
    patchLength = 9.398;
% ---- 相邻金属贴片中心距(centreDistence)	14.986
    centreDistance = 14.986;


% ---- RF MEMS开关的长度(switchLength)	centreDistence - patchLength
    % ---- 为修改之前的长度
    % ---- switchLength = 2.159;
    
    % ---- 修改说明 ---- %
    % ---- 为了建模方便，开关的长度等于一个贴片的一边到另一个贴片的另一边的距离
    % ---- 也即是：centreDistence - patchLength
    switchLength = centreDistance - patchLength;
% ---- RF MEMS开关的宽度(switchWidth)	1.27
    switchWidth = 1.27;


% ---- 馈电线直径(portDiameter)	1.2
    portDiameter = 1.2;
% ---- 输入端口直径(inputDiameter)	3
    inputDiameter = 3;
% ---- 馈电点X轴坐标(portX)	3
    portX = 3;
% ---- 馈电点Y轴坐标(portY)	3
    portY = 3;


% ---- 正方形基底的厚度(height)	3.175
    height = 3.175;
% ---- 正方形基底的边长(substrateLength)	52.5272
    % ---- 为修改之前的长度
    % substrateLength = 52.5272;
    
    % ---- 修改说明 ---- %
    % ---- 为了获取更好的性能，缩短基底的长度
    % ---- 缩短为：2*( centreDistance+0.8* patchLength)
    substrateLength = 2 * (centreDistance + 0.8 * patchLength);
    
    
% ---- maxWavelength
    maxWavelength = 30;