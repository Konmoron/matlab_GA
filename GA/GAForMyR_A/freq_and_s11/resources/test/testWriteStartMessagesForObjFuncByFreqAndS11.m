%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试writeMessagesForObjFuncByBand ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.测试writeMessagesForObjFuncByBand
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 声明全局变量
    global objFreq
%% ---- 开始时间
    startTime = clock;
%% ---- 加载参数文件
    % ---- 加载天线模型参数
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                本脚本包含可重构天线模型所有的基本尺寸的数据
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        modelParameters;
    % ---- 加载HFSS求解设置参数
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                此脚本包含求解频率setupFreq和扫描频率sweep，以及它们对应的HFSS形式的字符串名字
                详细信息请参见setupParametersOfHFSS.m脚本
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        setupParametersOfHFSSForForObjFuncByFreqAndS11;
    % ---- 加载遗传算法设置
        GASetupForObjFuncByFreqAndS11;
%% ---- 定义求解频率
    objFreq = 3.3;
%% ---- 将设置信息写入Data文件
    writeStartMessagesForObjFuncByFreqAndS11;