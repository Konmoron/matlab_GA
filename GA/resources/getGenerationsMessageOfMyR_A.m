%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于根据统计变量得到当前染色体的信息 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.根据统计变量得到当前染色体的信息
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % ---- 染色体的信息包括：
            % ---- 1.代数generationsOfMyR_A
                % ---- 也就是当前染色体属于第几代
            % ---- 2.位置generationsPositionOfMyR_A
                % ---- 当前染色体是generationsOfMyR_A代的第几个染色体

function [generationsOfMyR_A, generationsPositionOfMyR_A] = getGenerationsMessageOfMyR_A()
%% ---- 声明全局变量
    global count PopulationSize
%% ---- 代数generationsOfMyR_A
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
                fix的作用是去掉小数部分
                因此需要加上1
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    generationsOfMyR_A = fix(count / PopulationSize);
%% ---- 得到位置generationsPositionOfMyR_A
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
                fix的作用是去掉小数部分
                因此需要加上1
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    generationsPositionOfMyR_A = rem(count, PopulationSize);
%% ---- 判断当前染色体是否是当前代的最后一个个体
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
                这里需要注意一点：当统计变量是PopulationSize的整数倍的时候，也就是当前代的最后一个个体（此时generationsPositionOfMyR_A == 0）
                    此时代数generationsOfMyR_A要减1，而位置要设置为PopulationSize
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    if generationsPositionOfMyR_A == 0
        generationsOfMyR_A = generationsOfMyR_A - 1;
        generationsPositionOfMyR_A = PopulationSize;
    end
end

