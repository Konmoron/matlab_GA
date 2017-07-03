% ==== 本文用于测试处理生成的数据 ==== 


% ---- 测试文件：ModelExecuteFastDemoDataFile
% ---- 文件位置：G:\my_document\MATLAB\data_file\test\reconfigrable_antenna\model\ModelExecuteFastDemoDataFile.m
% ---- 此数据由ModelExecuteFastDemo.m生成，此文件的位置：G:\my_document\MATLAB\hfss_matlab\test\reconfigrable_antenna\model\ModelExecuteFastDemo.m


% ---- 测试目的：
    % ---- 得到指定频率对应的S11参数
 
    
%% ---- clear and close
    clc;
    clear;
    close all;
    
    fprintf('clear and close---->完毕\n\n');
    
    
%% ---- 加载数据文件
    ModelExecuteFastDemoDataFile;
    
    fprintf('加载数据文件---->完毕\n\n');
    

%% ---- 得到指定Frequency对应的S11参数
    for ii = 1:1:900;
        s11 = 20*log10(abs(S(ii,:,:)));
    
        fprintf('%.0f s11 = %.4f\n', ii, s11);
        
        if s11 < -10
            break;
        end
    end

%% ---- 画天线的S11随着Frequency变化的图形
    figure;
	plot(f/1e9, 20*log10(abs(S)),'b');
	xlabel('Frequency (GHz) ->');
	ylabel('S_{11} (dB) ->');
    % ---- 此处坐标轴的意义是：将Frequency限制在1.5-2.5之内
        % ---- 注意 ---- %
        % ---- 注意 ---- %
        % ---- 注意 ---- %
            % ----
            % 此处1.5和2.5不能写成：1.5e9,2.5e9，因为，上面f/1e9已经除了e9，所以，此时的坐标轴是1-10，而不是1e9-10e9
            % ----
        % ---- 注意 ---- %
        % ---- 注意 ---- %
        % ---- 注意 ---- %
    axis([1.5 2.5 -20 0]);
    
    fprintf('画天线的S11随着Frequency变化的图形---->完毕\n\n');