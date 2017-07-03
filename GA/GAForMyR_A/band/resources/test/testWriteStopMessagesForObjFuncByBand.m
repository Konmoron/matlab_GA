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
%% ---- 写入初始信息
    testWriteStartMessagesForObjFuncByBand;
%% ---- 结束时间
    stopTime = clock;
%% ---- pop
    pop = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
%% ---- fival
    fival = -125;
%% ---- 写入结束信息
    writeStopMessagesForObjFuncByBand;