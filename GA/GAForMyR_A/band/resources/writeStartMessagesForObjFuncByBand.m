%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于将信息写入数据文件 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.将信息写入数据文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% ---- 声明全局变量
    global PopulationSize setupFreq startFreq stopFreq  portX portY
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
    fidTxtForObjFuncByBand = fopen('..\matlab\data_file\ga_data\DataForObjFuncByBand.txt', 'a');
%% ---- 写入声明信息
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForObjFuncByBand);
    % ---- 写入声明信息
        fprintf(fidTxtForObjFuncByBand, '* 本文件用于储存遗传算法的仿真数据，这些数据由objFuncByBand函数产生\r\n');
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForObjFuncByBand);
%% ---- 写入开始时间信息
    % ---- 将时间转换为字符串
        startTimeStr = num2str(startTime);
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForObjFuncByBand);
    % ----- 写入时间信息        
        fprintf(fidTxtForObjFuncByBand, '* 本次仿真开始于%s\r\n', startTimeStr);
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForObjFuncByBand);
%% ---- 写入目标频段和HFSS求解设置
    % ---- 写入目标频段
        fprintf(fidTxtForObjFuncByBand, '* 求解频段是：%.2fGHz-%.2fGHz\r\n', objFreq - 0.05, objFreq + 0.05);
        fprintf(fidTxtForObjFuncByBand, '*\r\n');
    % ---- 写入HFSS求解设置
        fprintf(fidTxtForObjFuncByBand, '* HFSS求解设置为：\r\n');
        fprintf(fidTxtForObjFuncByBand, '* \t求解频率是：%.2fGHz\r\n', setupFreq);
        fprintf(fidTxtForObjFuncByBand, '* \t扫频范围是：%.2fGHz-%.2fGHz\r\n', startFreq, stopFreq);
        fprintf(fidTxtForObjFuncByBand, '*\r\n');
%% ---- 写入馈电点位置信息
    fprintf(fidTxtForObjFuncByBand, '* 天线模型的馈点坐标是：portX = %.2fmm，portY = %.2fmm\r\n', portX, portY);
    fprintf(fidTxtForObjFuncByBand, '*\r\n');
%% ---- 写入遗传算法一些重要的参数
    fprintf(fidTxtForObjFuncByBand, '* 遗传算法的一些参数为：\r\n');
    % ---- 写入遗传算法一些重要的参数
        fprintf(fidTxtForObjFuncByBand, '* \t种群大小为：%.f\r\n', PopulationSize);
        fprintf(fidTxtForObjFuncByBand, '* \t交叉概率为：%.2f\r\n', CrossoverFraction);
        fprintf(fidTxtForObjFuncByBand, '* \t变异概率为：%.2f\r\n', MigrationFraction);
        fprintf(fidTxtForObjFuncByBand, '* \t终止条件为：Generations = %.0f，FitnessLimit = %.2f\r\n', Generations, FitnessLimit);
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForObjFuncByBand);
%% ---- 补充信息
    fprintf(fidTxtForObjFuncByBand, '*\r\n');
    fprintf(fidTxtForObjFuncByBand, '* 下面是仿真数据\r\n');
    fprintf(fidTxtForObjFuncByBand, '*\r\n');
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForObjFuncByBand);
    fprintf(fidTxtForObjFuncByBand, '\r\n');
    fprintf(fidTxtForObjFuncByBand, '\r\n');
%% ---- 关闭文件
    fclose(fidTxtForObjFuncByBand);