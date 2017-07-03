%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于测试Cell ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.测试Cell
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%% ---- clear and close
    clc;
    clear;
    close all;            
%% ---- 设定天线阵列的行数和列数
    % ---- 设定行数m
        m = 5;
    % ---- 设定列数n
        n = 5;
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
        modelParametersFor_M_N_R_A;
%% ---- 得到numOfPatch_Switch
    numOfPatch = m * n;
    numOfPatch_Switch = numOfPatch + numOfSwitch;
%% ---- 创建一个cell元包
    Patch_Switch = cell(1, numOfPatch_Switch);
%% ---- 定义Patch_Switch的索引index_Patch_Switch
    index_Patch_Switch = 1;
%% ---- 赋值
    for ii = 1:1:m
        for jj = 1:1:n
            Patch_Switch{index_Patch_Switch} = ['Patch' num2str(ii) num2str(jj)];
            index_Patch_Switch = index_Patch_Switch + 1;
        end
    end
    for ii = 1:1:numOfSwitch
        Patch_Switch{index_Patch_Switch} = ['Switch' num2str(ii)];
        index_Patch_Switch = index_Patch_Switch + 1;
    end
%% ---- disp
    disp(Patch_Switch);