%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数是目标函数，也即是遗传算法的适应度函数 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 根据根据频段得到染色体pop的适应度 ---- %
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
function scores = objFuncByFreq(pop)
%{ 
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
            1.scores是染色体pop的适应度，由getScoresByFreq函数得到，也是适应度函数返回给遗传算法的值
            2.pop是染色体，也即0和1组成的数组，pop是遗传算法传递给适应度函数的染色体参数，pop中的每个元素代表的开关的详细信息可参见：myTestPop.m
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
%}
%% ---- 声明全局变量
    global count
%% ---- 计时开始
    % ---- 用于统计运行时间
    tic;
%% ---- 定义tmpSwtichArray数组，并将pop赋值给tmpSwtichArray
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            这样做有两个目的：
                1.运用了封装的思想，让pop对其他的程序不可见，这样保证了pop的安全性
                2.为了方便测试

            tmpSwtichArray将被createUniteReconfigurableAntennaModel.m调用，用于判断开关的断开和闭合，详细信息可参见：myTestPop.m
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
        tmpSwtichArray = pop;
%% ---- 调用函数getGenerationsMessageOfMyR_A，得到当前染色体的信息
    [generationsOfMyR_A, generationsPositionOfMyR_A] = getGenerationsMessageOfMyR_A();
%% ---- 输出当前染色体信息
    fprintf('正在计算染色体：');
    fprintf('%.0f ', tmpSwtichArray);
    fprintf('的适应度，这是第%.0f个染色体，是第%.0f代的第%.0f个染色体\n', count, generationsOfMyR_A, generationsPositionOfMyR_A);
%% ---- 加载模型执行脚本executeModel.m
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此脚本的作用是：
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % ---- 1.执行建模脚本            
                % ---- 2.设置求解频率、扫频范围   
                % ---- 3.执行HFSS仿真            
                % ---- 4.输出仿真数据            
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    exe_ModelForObjFuncByFreqAndS11;
%% ---- 调用getFreqAndS11函数，得到染色体对应的freq和S11
    [freq, s11] = getFreqAndS11ForTest(tmpDataFile);
%% ---- 调用getScoresByFreqAndS11_V2函数，得到染色体pop的适应度值
    scores = getScoresByFreq(freq);
%% ---- 将所有信息写入文件
    writeDataForObjFuncByFreqAndS11;
%% ---- 输出当前染色体的信息
    fprintf('    经过计算，该染色体的工作频率是：%.2f，其对应的S11参数是：%.2f，适应度值是：%.2f\n', freq, s11, scores);
%% ---- 统计变量加1
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            用于统计开关组合状态的个数
            一个开关组合状态仿真完毕之后，count + 1
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    count = count + 1;
%% ---- 计时结束
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            toc自带输出功能
            函数执行完到toc，就会输出运行的时间
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
        toc;
    % ---- 换行
    	fprintf('\n');
end