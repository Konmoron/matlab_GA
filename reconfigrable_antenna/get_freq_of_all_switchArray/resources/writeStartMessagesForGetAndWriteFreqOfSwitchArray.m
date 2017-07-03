%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于将信息写入数据文件 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.将信息写入数据文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% ---- 声明全局变量
    global setupFreq startFreq stopFreq  portX portY
%% ---- 打开数据文件
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            ‘a’ ：以追加方式打开文件，打开文件后指针位于文件末尾。文件不存在则创建。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    fidTxtForGetAndWriteFreqOfSwitchArray = fopen('..\matlab\data_file\freq_of_all_switchArray\freqAndS11OfAllSwitchArray.txt', 'a');
%% ---- 写入声明信息
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
    % ---- 写入声明信息
        fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* 本文件用于储存所有开关组合的工作频率和S11，这些数据由getFreqOfAllSwitchArray函数产生\r\n');
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
%% ---- 写入开始时间信息
    % ---- 将时间转换为字符串
        startTimeStr = num2str(startTime);
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
    % ----- 写入时间信息        
        fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* 本次仿真开始于%s\r\n', startTimeStr);
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
%% ---- 写入HFSS求解设置
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* HFSS求解设置为：\r\n');
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* \t求解频率是：%.2fGHz\r\n', setupFreq);
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* \t扫频范围是：%.2fGHz-%.2fGHz\r\n', startFreq, stopFreq);
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '*\r\n');
%% ---- 写入馈电点位置信息
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* 天线模型的馈点坐标是：portX=%.2fmm，portY=%.2fmm\r\n', portX, portY);
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '*\r\n');
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
%% ---- 补充信息
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '*\r\n');
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '* 下面是仿真数据\r\n');
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '*\r\n');
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForGetAndWriteFreqOfSwitchArray);
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '\r\n');
    fprintf(fidTxtForGetAndWriteFreqOfSwitchArray, '\r\n');
%% ---- 关闭文件
    fclose(fidTxtForGetAndWriteFreqOfSwitchArray);