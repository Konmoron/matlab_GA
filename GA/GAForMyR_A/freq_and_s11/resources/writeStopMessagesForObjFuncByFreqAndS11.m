%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于将信息写入数据文件 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.将信息写入数据文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




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
    fidTxtForObjFuncByFreqAndS11 = fopen('..\matlab\data_file\ga_data\DataForObjFuncByFreqAndS11.txt', 'a');
%% ---- 换行
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
%% ---- 写入开始时间信息
    % ---- 将时间转换为字符串
        stopTimeStr = num2str(stopTime);
    % ---- 调用函数写入100个“*”
        write100Star(fidTxtForObjFuncByFreqAndS11);
    % ----- 写入时间信息        
        fprintf(fidTxtForObjFuncByFreqAndS11, '* 本次仿真结束于%s\r\n', stopTimeStr);
%% ---- 写入仿真时间
    % ---- 得到仿真时间
        spendTime = etime(stopTime, startTime);
    % ---- 将仿真时间写入Data文件
        fprintf(fidTxtForObjFuncByFreqAndS11, '* 本次仿真共用时%f秒\r\n', spendTime);
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForObjFuncByFreqAndS11);
%% ---- 写入最佳个体
    fprintf(fidTxtForObjFuncByFreqAndS11, '* 本次仿真得到的最佳个体是：pop = ');
    fprintf(fidTxtForObjFuncByFreqAndS11, '%.0f ', pop);
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
%% ---- 写入最佳个体对应的适应度值
    fprintf(fidTxtForObjFuncByFreqAndS11, '* 最佳个体的适应度值是：%.3f', fival);
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
%% ---- 调用函数写入100个“*”
    write100Star(fidTxtForObjFuncByFreqAndS11);
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
    fprintf(fidTxtForObjFuncByFreqAndS11, '\r\n');
%% ---- 关闭文件
    fclose(fidTxtForObjFuncByFreqAndS11);