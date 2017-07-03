%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试MATLAB里面数据写入Excel ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ---- 计时开始
    % ---- 用于统计运行时间
    
    tic;
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 定义基本参数
    freq = 4;
    s11 = -30;
%% ---- 定义统计变量
    count = 1;
%% ---- 定义染色体
    myReconfigurableAntennaTempPop = [0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1];
%% ---- 写入Excel文件
%     for ii = 1:1:100
%         currentRowNumber = ['A',num2str(count), ':B',num2str(count), ':C',num2str(count), ':D',num2str(count), ':E',num2str(count), ':F',num2str(count), ...
%             ':G',num2str(count), ':H',num2str(count), ':I',num2str(count), ':J',num2str(count), ':K',num2str(count), ':L',num2str(count), ...
%             ':M',num2str(count), ':N',num2str(count)];
%         disp(currentRowNumber);
%         xlswrite('J:\data\graduation_projects\test\data_file\testXlswrite.xlsx', [myReconfigurableAntennaTempPop freq s11], currentRowNumber);
%         count = count + 1;
%     end
    
    for gene1 = 0:1:1
        for gene2 = 0:1:1
           for gene3 = 0:1:1
              for gene4 = 0:1:1
                  for gene5 = 0:1:1
                     for gene6 = 0:1:1
                         for gene7 = 0:1:1
                             for gene8 = 0:1:1
                                 for gene9 = 0:1:1
                                     for gene10 = 0:1:1
                                         for gene11 = 0:1:1
                                             for gene12 = 0:1:1
                                                 % ---- 生成染色体
                                                    myCurrentPop = [gene1, gene2, gene3, gene4, gene5, ...
                                                        gene6, gene7, gene8, gene9, gene10, gene11, gene12];
                                                    currentRowNumber = ['A',num2str(count), ':B',num2str(count), ':C',num2str(count), ':D',num2str(count), ':E',num2str(count), ':F',num2str(count), ...
                                                        ':G',num2str(count), ':H',num2str(count), ':I',num2str(count), ':J',num2str(count), ':K',num2str(count), ':L',num2str(count), ...
                                                        ':M',num2str(count), ':N',num2str(count)];
                                                            disp(currentRowNumber);
                                                    xlswrite('G:\my_document\graduation_projects\data_file\test\testXlswrite.xlsx', [myCurrentPop freq s11], currentRowNumber);
                                                 % ---- 已经计算的染色体数目+1
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