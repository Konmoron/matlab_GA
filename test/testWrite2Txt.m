%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试MATLAB里面数据写入TXT ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ---- 计时开始
    % ---- 用于统计运行时间
    
    tic;
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 定义基本参数
    freq = 5;
    s11 = -40;
%% ---- 定义染色体
    myReconfigurableAntennaTempPop = [0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1];
%% ---- 定义统计变量
    count = 1;
%% ---- 写入TXT文件
%     % ---- 打开文件
%         fidTxt = fopen('G:\my_document\graduation_projects\data_file\test\testWrite2Txt.txt', 'a');
    % ---- 写入文件
%         for ii = 1:1:100
%             fprintf(fidTxt, '%.0f ', myReconfigurableAntennaTempPop);
%             fprintf(fidTxt, '%.8f %.8f\n', freq, s11);
%         end
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
                                                     fidTxt = fopen('G:\my_document\graduation_projects\data_file\test\testWrite2Txt.txt', 'a');
                                                     % ---- 生成染色体
                                                        myCurrentPop = [gene1, gene2, gene3, gene4, gene5, ...
                                                            gene6, gene7, gene8, gene9, gene10, gene11, gene12];
                                                     % ---- 已经计算的染色体数目+1
                                                         fprintf(fidTxt, '%.0f ', myCurrentPop);
                                                         fprintf(fidTxt, '%.8f %.8f\r\n', freq, s11); % ---- txt里面的换行是“\r\n”
                                                     % ---- 输出count
                                                        disp(count);
                                                     % ---- 已经计算的染色体数目+1
                                                         count = count + 1;
                                                     fclose(fidTxt);
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
%     % ---- 关闭文件
%         fclose(fidTxt);
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