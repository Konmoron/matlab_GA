%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于根据目标函数objFuncByFreq执行遗传算法 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.根据目标函数objFuncByFreq执行遗传算法
            % ---- 2.整个程序的入口
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            官方推荐使用下面这种方式设置参数：
                options = gaoptimset(options, 'PopulationSize', 30);
                    括号内的options是前面设置的options
            当然，使用（options.PopulationSize = 30;）这种方式也是可以的
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 开始时间
    startTime = clock;
%% ---- 声明全局变量
    global count objFreq m n tmpfileDirectory numOfSwitch;
%% ---- 设定天线阵列的行数和列数
    % ---- 设定行数m
        m = 5;
    % ---- 设定列数n
        n = 5;
%% ---- 定义目标频率
    objFreq = 3.81;
    % ---- 判断objFreq的值，如果小于等于0.5，就报错
        if objFreq <= 0.5
            error('ErrorTests:convertTest', ... 
          '\n    objFreq必须大于0.5GHz');
        end
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
    % ---- 加载HFSS求解设置参数
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                此脚本包含求解频率setupFreq和扫描频率sweep，以及它们对应的HFSS形式的字符串名字
                详细信息请参见setupParametersOfHFSS.m脚本
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        setupParam_HFSS_GA;
    % ---- 加载fileDirectoryParameters.m脚本
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
    % ---- 加载遗传算法参数
        GASetupForObjFuncByFreqAndS11;
%% ---- 定义统计变量
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            用于统计开关组合状态的个数
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    count = 1;
%% ---- 设置目标函数
    FitnessFcn = @objFuncByFreq;
%% ---- 定义变量的个数，也就是基因的个数，在可重构天线里面代表开关的个数
    GenomeLength = numOfSwitch;
%% ---- 将设置信息写入Data文件
    writeStartMessagesForObjFuncByFreqAndS11;
%% ---- 运行ga
    [pop, fival, exitflag, output, populations, scores] = ga(FitnessFcn, GenomeLength, options);
%% ---- 结束时间
    stopTime = clock;
%% ---- 写入结束信息
    writeStopMessagesForObjFuncByFreqAndS11;
%% ---- 保存仿真结果
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            保存的仿真结果可以通过下面的方式调用，以便得到同样的仿真数据
                %% ---- 加载load数据mat文件
                    load('MessageForObjFuncByFreqAndS11.mat');
                %% ---- 还愿以前的仿真参数，以便得到以前的仿真结果
                    stream = RandStream.getGlobalStream;
                    stream.State = output.rngstate.state;
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    save('..\matlab\data_file\ga_data\MessageForObjFuncByFreqAndS11.mat');