%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试数组 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ---- clear and close
    clc;
    clear;
    close all;
    
    fprintf('clear and close---->完毕\n\n');
    
%% ---- 定义数组myPop
    myPop = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    
    fprintf('定义数组myPop---->完毕\n\n');
    
    fprintf('正在计算染色体：');
    fprintf('%.0f ', myPop);
    fprintf('的适应度\n\n');
    

    
%% ---- 测试数组的引用
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    % ---- 注意 ---- %
        % ---- MATLAB里面的数组初始索引是1，不是0
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    % ---- 注意 ---- %
    
    for ii = 1:1:12
        fprintf('myPop(%.0f) \t= %.0f\n', ii, myPop(ii));
    end
    
    fprintf('%.0f ', myPop);
    
    fprintf('\n测试数组的引用---->完毕\n\n');