%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试getFreqOfAllSwitchArray ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 测试getFreqOfAllSwitchArray ---- %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 开始时间
    startTime = clock;
%% ---- 写入开始信息
    writeStartMessagesForGetAndWriteFreqOfSwitchArray;
%% ---- 定义已经计算的开关组合数目
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            定义count主要有两个作用：
                1.为writeFreq函数提供索引，从而可以将得到的工作频率和对应的S11参数追加写入txt
                2.统计计算了多少个开关组合
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    count = 1;
%% ---- 加载开关组合数组文件
    myTestSwitchArray;
%% ---- 得到所有开关组合
    for ii = 1:1:m
        % ---- 生成开关组合
            myCurrentSwitchArray = myTestSwitchArrayArray(ii, :);
        % ---- 调用函数，得到当前开关组合的工作频率，及其对应的S11参数，并将它们写入文件
            getAndWriteFreqOfSwitchArray(myCurrentSwitchArray, count);
        % ---- 已经计算的开关组合数目+1
            count = count + 1;
     end
%% ---- 结束时间
    stopTime = clock;
%% ---- 写入结束信息
    writeStopMessagesForGetAndWriteFreqOfSwitchArray;