%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于将指定开关组合的工作频率及其对应的S11参数和适应度值写入文件 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.将指定开关组合的工作频率及其对应的S11参数和适应度值写入文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ---- 声明全局变量
    global count
%% ---- 打开文件
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            ‘a’ ：以追加方式打开文件，打开文件后指针位于文件末尾。文件不存在则创建。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    fidTxtForObjFuncByFreqAndS11 = fopen('..\matlab\data_file\ga_data\DataForObjFuncByFreqAndS11.txt', 'a');
%% ---- 写入TXT文件
    % ---- 将开关组合写入文件
        fprintf(fidTxtForObjFuncByFreqAndS11, '%.0f ', tmpSwtichArray);
    % ---- 将其他信息写入文件
        fprintf(fidTxtForObjFuncByFreqAndS11, '%.2f %.2f %.2f %.3f %.0f %.0f %.0f', freq, s11, s11OfobjFreq, scores, count, generationsOfMyR_A, generationsPositionOfMyR_A);
    % ---- 换行
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                windows下的txt的换行符是“\r\n”
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
%% ---- 关闭文件
    fclose(fidTxtForObjFuncByFreqAndS11);