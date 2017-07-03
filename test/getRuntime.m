%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试得到程序运行时间 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.测试得到程序运行时间
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
%% ---- clear and close
    clc;
    clear;
    close all;            
%% ---- 计时开始
    tic;
%% ---- 将开始时间写入文件
%     format shortg
    startTime = clock;
%     startTime = fix(startTime);
%     disp(startTime);
    startTimeStr = num2str(startTime);
    fid = fopen('..\graduation_projects\data_file\test\testWriteTime.txt', 'a');
    % ---- 调用函数写入100个“*”
        write100Star(fid);
    fprintf(fid, '* 本次仿真开始于');
    
    fprintf(fid, '%s', startTimeStr);
    fprintf(fid, '\r\n');
    % ---- 调用函数写入100个“*”
        write100Star(fid);
    fclose(fid);
%% ---- 程序内容
    % ---- 定义sum
    sum = 0;
    
    % ---- 求和
    for ii = 1:1:1000
        sum = ii + sum;
    end
    
    % ---- 输出sum
    fprintf('sum = %.0f\n\n', sum);
%% ---- 计时结束
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    % ---- 注意 ---- %
        % ---- toc自带输出功能 ---- %
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    toc;
%% ---- 将时间写入文件
    stopTime = clock;
%     stopTime = fix(stopTime);
    stopTimeStr = num2str(stopTime);
    fid = fopen('..\graduation_projects\data_file\test\testWriteTime.txt', 'a');
    % ---- 调用函数写入100个“*”
        write100Star(fid);
    fprintf(fid, '* 本次仿真结束于');
    fprintf(fid, '%s', stopTimeStr);
    fprintf(fid, '\r\n');
    e = etime(stopTime, startTime);
%     disp(e);
    fprintf(fid, '* 本次仿真共用时%f秒', e);
    fprintf(fid, '\r\n');
    % ---- 调用函数写入100个“*”
        write100Star(fid);
    fclose(fid);