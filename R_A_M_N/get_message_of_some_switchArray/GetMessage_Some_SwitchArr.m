%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于得到单个频点的所有开关组合的S11参数图 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 得到单个频点的所有开关组合的S11参数图
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 定义全局变量
    global m n tmpfileDirectory;
%% ---- 设定天线阵列的行数和列数
    % ---- 设定行数m
        m = 5;
    % ---- 设定列数n
        n = 5;
%% ---- 加载参数文件
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
%% ---- 加载fileDirectoryParameters.m脚本
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            1.本脚本包含3个数组：
                第一个数组fileDirectoryOfLab对应的是实验室电脑的目录
                第二个数组fileDirectoryOfServer对应的是实验室服务器的目录
                第二个数组fileDirectoryOfThinkpad对应的是我的笔记本的目录

                使用的时候请根据使用环境，调用对应的数组

            2.每个数组包含5个元素：
                第一个元素hfssMatlabApiDirectory是HFSS-MATLAB-API所在目录
                第二个元素prjFileDirectory是工程文件保存目录
                第三个元素scriptFileDirectory是脚本文件保存目录
                第四个元素dataFileDirectory是HFSS输出数据的保存目录
                第五个元素hfssExecutePath是HFSS的执行路径

            3.之所这么做是因为在不同的运行环境，总是需要修改这些目录，
              因此将所有的目录统一在一个文件里面，
              并将同一个运行环境的目录保存在一个数组里面，
              这样执行文件只需要更改调用的数组即可，无需再修改原始目录
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    fileDirectoryParameters_V2ForTest;
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处之所以定义tmpfileDirectory，有两个优点：
                1.为了修改方便。更改运行环境之后，只需要将相应的数组赋值给tmpfileDirectory，
                  即可，无需多余的操作，极大地降低了操作的繁琐性。
                2.利用了封装的思想，使原数组对后面的操作不可见，保护了原数组的安全。
    
            此处之所将tmpfileDirectory定义为全局变量
                是因为exe_M_N_R_A_Model_Some_SwitchArr需要使用此变量
                但是exe_M_N_R_A_Model_Some_SwitchArr和当前文件没有直接调用关系
                因此需要定义为全局变量
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    tmpfileDirectory = fileDirectory;
%% ---- 加载开关组合数组文件
    testArrFor_Some_SwitchArr;
%% ---- 得到所有开关组合
    for ii = 1:1:numOfSwitchArr
        % ---- 生成开关组合
            myCurrentSwitchArray = SwitchArrayOf_M_N_R_A_Model_Some_SwitchArr(ii, :);
        % ---- 调用函数，得到当前开关组合的工作频率，及其对应的S11参数，并将它们写入文件
            getMessage_OneSwitchArrForSome_SwitchArr(myCurrentSwitchArray);
    end