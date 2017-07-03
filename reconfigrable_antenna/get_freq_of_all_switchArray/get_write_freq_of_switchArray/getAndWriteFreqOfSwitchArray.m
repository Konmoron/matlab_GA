%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于得到并输出指定开关组合的工作频率 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.得到指定开关组合的工作频率以及对应的S11参数
            % ---- 2.将指定开关组合以及其对应的工作频率和S11参数存入txt文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function getAndWriteFreqOfSwitchArray(myCurrentSwitchArray, count)
%% ---- 计时开始
    % ---- 用于统计运行时间
        tic;
%% ---- 定义myReconfigurableAntennaTempSwitchArray数组，并将myCurrentSwitchArray赋值给myReconfigurableAntennaTempSwitchArray
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            这样做有两个目的：
                1.运用了封装的思想，让myCurrentSwitchArray对其他的程序不可见，这样保证了myCurrentSwitchArray的安全性
                2.为了方便测试

            myReconfigurableAntennaTempSwitchArray将被createUniteReconfigurableAntennaModel.m调用，用于判断开关的断开和闭合，详细信息可参见：myTestSwitchArray.m
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    tmpSwtichArray = myCurrentSwitchArray;
    % ---- 输出当前开关组合
        fprintf('正在计算开关组合：');
        fprintf('%.0f ', tmpSwtichArray);
        fprintf('的工作频率及其对应的S11参数，这是第%.0f个开关组合\n', count);
%% ---- 加载模型执行脚本executeModel.m
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此脚本的作用是：
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % ---- 1.执行建模脚本            
                % ---- 2.设置求解频率、扫频范围   
                % ---- 3.执行HFSS仿真            
                % ---- 4.输出仿真数据            
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    executeModelForGetAndWriteFreqOfSwitchArray;
%% ---- 调用getFreq函数，得到当前开关组合的工作频率和S11参数
    [freq, s11] = getFreqAndS11(tmpDataFile);
%% ---- 输出当前开关组合的信息
    fprintf('    经过计算，该开关组合的工作频率是：%.2f，其对应的S11参数是：%.2f\n', freq, s11);
%% ---- 将开关组合myReconfigurableAntennaTempSwitchArray对应的freq和S11写入文件
    writeFreqAndS11ForTest(freq, s11, count, tmpSwtichArray);
%% ---- 计时结束
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            toc自带输出功能
            函数执行完到toc，就会输出运行的时间
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
        toc;
    % ---- 换行
    	fprintf('\n');
end

