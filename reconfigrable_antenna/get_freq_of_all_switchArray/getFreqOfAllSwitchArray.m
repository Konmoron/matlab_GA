%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于输出所有开关组合的工作频率 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.产生所有的开关组合
            % ---- 2.得到每个开关组合的工作频率以及对应的S11参数
            % ---- 3.将开关组合以及其对应的工作频率和S11参数存入txt文件
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 开始时间
    startTime = clock;
%% ---- 写入开始信息
    writeStartMessagesForGetAndWriteFreqOfSwitchArray;
%% ---- 定义已经计算的开关组合数目
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            定义count主要有两个作用：
                1.为writeFreq函数提供索引，从而可以将得到的工作频率和对应的S11参数追加写入txt
                2.统计计算了多少个开关组合
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    count = 1;
%% ---- 使用12个for循环，得到所有开关组合
    for switch11 = 0:1:1
        for switch12 = 0:1:1
           for switch21 = 0:1:1
              for switch22 = 0:1:1
                  for switch23 = 0:1:1
                     for switch31 = 0:1:1
                         for switch32 = 0:1:1
                             for switch41 = 0:1:1
                                 for switch42 = 0:1:1
                                     for switch43 = 0:1:1
                                         for switch51 = 0:1:1
                                             for switch52 = 0:1:1
                                                 % ---- 生成开关组合
                                                    myCurrentSwitchArray = [switch11, switch12, switch21, switch22, switch23, ...
                                                        switch31, switch32, switch41, switch42, switch43, switch51, switch52];
                                                 % ---- 调用函数，得到当前开关组合的工作频率，及其对应的S11参数，并将它们写入文件
                                                    getAndWriteFreqOfSwitchArray(myCurrentSwitchArray, count);
                                                 % ---- 已经计算的开关组合数目+1
                                                    count = count + 1;
                                             end
                                         end
                                     end
                                 end
                             end
                         end
                     end
                  end
              end
           end
        end
    end
%% ---- 结束时间
    stopTime = clock;
%% ---- 写入结束信息
    writeStopMessagesForGetAndWriteFreqOfSwitchArray;