%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于根据工作频率和S11计算适应度值 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.根据工作频率和S11计算适应度值
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
function scores = getScoresByFreqAndS11(freq, s11)
%{ 
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
        此处的算法是：
            如果-10 < s11，就意味着此处的freq可能只是一个谐振点，性能不好，
                所以即使这个freq达到误差要求，也要舍去，也就是增加它的适应度值。
                    使用的方法是：
                        如果freq > objFreq，则freq + 1
                        如果freq < objFreq，则freq - 1
            如果-15 < s11 < -10，此时，freq可能是天线的谐振点，也可能不是
                但是这个freq的性能不好，所以也要增加它的适应度值
                    使用的方法是：
                        如果freq > objFreq，则freq + 0.5
                        如果freq < objFreq，则freq - 0.5
            如果-20 < s11 < -15，此时，freq可能是天线的谐振点，也可能不是
                但是这个freq的性能一般，所以也要适当增加它的适应度值
                    使用的方法是：
                        如果freq > objFreq，则freq + 0.2
                        如果freq < objFreq，则freq - 0.2
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
%}
%% ---- 声明全局变量
    global objFreq
%% ---- 根据算法得到适应度值
    if s11 > -10
        if freq > objFreq
            freq = freq + 1;
        else
            freq = freq - 1;
        end
    elseif s11 > -15 && s11 <= -10
        if freq > objFreq
            freq = freq + 0.5;
        else
            freq = freq - 0.5;
        end
    elseif s11 > -20 && s11 <= -15
        if freq > objFreq
            freq = freq + 0.2;
        else
            freq = freq - 0.2;
        end
    end
    
    scores = abs(objFreq - freq);
end

