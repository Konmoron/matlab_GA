%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于根据工作频率和s11OfobjFreq计算适应度值 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.根据工作频率和s11OfobjFreq计算适应度值
            % ----      此处s11OfobjFreq为目标频率对应的S11参数
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                       
function scores = getScoresByFreqAndS11_V4(freq, s11OfobjFreq)
%% ---- 声明全局变量
    global objFreq
%% ---- 得到初始的适应度值
    scores = abs(objFreq - freq);
%% ---- 根据算法修改适应度值
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处的算法是：
                如果-10 < s11OfobjFreq，就意味着目标频率对应的S11参数性能不好，
                    所以即使这个开关组合freq达到误差要求，也要舍去，也就是增加它的适应度值。
                        使用的方法是：
                            scores = scores + 0.1;
                如果-15 < s11OfobjFreq <= -10，此时，此时目标频率对应的S11参数性能还可以，也不是特别好，所以也要增加它的适应度值
                        使用的方法是：
                            scores = scores + 0.025;
                如果-20 < s11OfobjFreq <= -15，此时，此时目标频率对应的S11参数性能还可以，也不是特别好，所以也要增加它的适应度值
                        使用的方法是：
                            scores = scores + 0.015;
                如果-25 < s11OfobjFreq <= -20，此时，此时目标频率对应的S11参数性能达到要求，所以也要适当减小它的适应度值
                        使用的方法是：
                            scores = scores - 0.005;
                如果-30 < s11OfobjFreq <= -25，此时，此时目标频率对应的S11参数性能很好，所以也要适当减小它的适应度值
                        使用的方法是：
                            scores = scores - 0.025;
                如果s11OfobjFreq <= -30，此时，此时目标频率对应的S11参数性能菲常好，所以也要适当减小它的适应度值
                        使用的方法是：
                            scores = scores - 0.05;
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    if s11OfobjFreq > -10
        scores = scores + 0.1;
    elseif s11OfobjFreq > -15 && s11OfobjFreq <= -10
        scores = scores + 0.025;
    elseif s11OfobjFreq > -20 && s11OfobjFreq <= -15
        scores = scores + 0.015;
    elseif s11OfobjFreq > -25 && s11OfobjFreq <= -20
        scores = scores - 0.005;
    elseif s11OfobjFreq > -30 && s11OfobjFreq <= -25
        scores = scores - 0.025;
    elseif s11OfobjFreq <= -30
        scores = scores - 0.05;
    end
end

