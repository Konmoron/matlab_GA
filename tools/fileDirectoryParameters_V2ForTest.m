%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本储存目录信息 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
        1.本文件只提供目录，每个运行环境对应一个文件。
            每个运行环境只有hfssExecutePath是和其他运行环境不同。

        2.本文件提供一个fileDirectory数组，包含5个元素：
            第一个元素hfssMatlabApiPath是HFSS-MATLAB-API的路径
            第二个元素prjFileDirectory是工程文件保存目录
            第三个元素scriptFileDirectory是脚本文件保存目录
            第四个元素dataFileDirectory是HFSS输出数据的保存目录
            第五个元素hfssExecutePath是HFSS的执行路径

        3.之所这么做是因为，在版本V1里面，调用的时候还需要根据使用环境更改调用的数组
          此次更改之后，在运行环境下修改一次，以后不需要在修改任何信息
    ---- 注意 ----
    ---- 注意 ----
    ---- 注意 ----
%}

% %% ---- 创建实验室电脑的fileDirectory数组
%     %{
%         ---- 注意 ----
%         ---- 注意 ----
%         ---- 注意 ----
%             本数组用于实验室电脑，调用时需要注意使用环境
%         ---- 注意 ----
%         ---- 注意 ----
%         ---- 注意 ----
%     %}
%     % ---- 创建第一个元素hfssExecutePath，本目录是HFSS-MATLAB-API的路径
%         hfssMatlabApiPath = '..\matlab\hfss_matlab_api';
%     % ---- 创建第二个元素prjFileDirectory，本目录是工程文件保存目录
%         prjFileDirectory = '..\matlab\data_file\hfss_file';
%     % ---- 创建第三个元素scriptFileDirectory，本目录是脚本文件保存目录
%         scriptFileDirectory = '..\matlab\data_file\vbs';
%     % ---- 创建第四个元素dataFileDirectory，本目录是HFSS输出数据的保存目录
%         dataFileDirectory = '..\matlab\data_file\hfss_data';
%     % ---- 创建第五个元素hfssExecutePath，本目录是HFSS的执行路径
%         %{ 
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%                 ---- 1： ----
%                     此处"Program Files"需要加双引号，原因不明
%                     但是如果HFSS没有安装在在Program Files里面，则不需要添加
%                 ---- 2： ----
%                     对于HFSS 16.1，HFSS的执行文件是ansysedt.exe，不是hfss.exe
%                     其他版本自行检查
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%         %}
%         hfssExecutePath = 'D:\"Program Files"\AnsysEM\AnsysEM16.1\Win64\ansysedt.exe';
%         
%     % ---- 将所有元素添加到fileDirectory中
%         %{
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%                 %%%%%%%%%%%%%%%%%%%%%%
%                 % ---- 调用须知 ---- %
%                 %%%%%%%%%%%%%%%%%%%%%%
%                 %    因为此处是将所有的元素以cell数组方式储存的
%                 %    但是，HFSS路径不接受cell数组方式的路径
%                 %    因此需要在调用的时候将被调用的元素转化为字符串数组的形式
%                 %    也即使用char()函数
%                 %        例子：
%                 %            比如要使用第一个元素作为目录时，使用如下方式：
%                 %                char(tmpfileDirectory(1));
%                 %            将cell方式的数组转化为char类型的数组
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%         %}
%         fileDirectory = {hfssMatlabApiPath; prjFileDirectory; ...
%             scriptFileDirectory; dataFileDirectory; hfssExecutePath};
%     %{
%         % ---- 测试fileDirectory数组
%             [m, n] = size(fileDirectory);
%             disp(m);
%             disp(n);
%             for ii = 1:1:m
%                 fprintf('当前的目录是：');
%                 disp(char(fileDirectory(ii));
%                 fprintf('\n');
%             end
%     %}
            
            
            
            
% %% ---- 创建服务器的fileDirectory数组
%     %{
%         ---- 注意 ----
%         ---- 注意 ----
%         ---- 注意 ----
%             本数组用于实验室服务器，调用时需要注意使用环境
%         ---- 注意 ----
%         ---- 注意 ----
%         ---- 注意 ----
%     %}
%     % ---- 创建第一个元素hfssExecutePath，本目录是HFSS-MATLAB-API的路径
%         hfssMatlabApiPath = 'E:\ChaoQiang\matlab\hfss_matlab_api';
%     % ---- 创建第二个元素prjFileDirectory，本目录是工程文件保存目录
%         prjFileDirectory = 'E:\ChaoQiang\matlab\data_file\hfss_file';
%     % ---- 创建第三个元素scriptFileDirectory，本目录是脚本文件保存目录
%         scriptFileDirectory = 'E:\ChaoQiang\matlab\data_file\vbs';
%     % ---- 创建第四个元素dataFileDirectory，本目录是HFSS输出数据的保存目录
%         dataFileDirectory = 'E:\ChaoQiang\matlab\data_file\hfss_data';
%     % ---- 创建第五个元素hfssExecutePath，本目录是HFSS的执行路径
%         %{ 
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%                 ---- 1： ----
%                     此处"Program Files"需要加双引号，原因不明
%                     但是如果HFSS没有安装在在Program Files里面，则不需要添加
%                 ---- 2： ----
%                     对于HFSS 16.1，HFSS的执行文件是ansysedt.exe，不是hfss.exe
%                     其他版本自行检查
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%         %}
%         hfssExecutePath = 'D:\HFSS\AnsysEM16.1\Win64\ansysedt.exe';
%     
%     % ---- 将所有元素添加到fileDirectory中
%         %{
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%                 %%%%%%%%%%%%%%%%%%%%%%
%                 % ---- 调用须知 ---- %
%                 %%%%%%%%%%%%%%%%%%%%%%
%                 %    因为此处是将所有的元素以cell数组方式储存的
%                 %    但是，HFSS路径不接受cell数组方式的路径
%                 %    因此需要在调用的时候将被调用的元素转化为字符串数组的形式
%                 %    也即使用char()函数
%                 %        例子：
%                 %            比如要使用第一个元素作为目录时，使用如下方式：
%                 %                char(tmpfileDirectory(1));
%                 %            将cell方式的数组转化为char类型的数组
%             ---- 注意 ----
%             ---- 注意 ----
%             ---- 注意 ----
%         %}
%         fileDirectory = {hfssMatlabApiPath; prjFileDirectory; ...
%             scriptFileDirectory; dataFileDirectory; hfssExecutePath};
%     %{
%         % ---- 测试fileDirectory数组
%             [m, n] = size(fileDirectory);
%             disp(m);
%             disp(n);
%             for ii = 1:1:m
%                 fprintf('当前的目录是：');
%                 disp(char(fileDirectory(ii));
%                 fprintf('\n');
%             end
%     %}




%% ---- 创建笔记本的fileDirectory数组
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            本数组用于Thinkpad，调用时需要注意使用环境
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 创建第一个元素hfssExecutePath，本目录是HFSS-MATLAB-API的路径
        hfssMatlabApiPath = '..\matlab\hfss_matlab_api';
    % ---- 创建第二个元素prjFileDirectory，本目录是工程文件保存目录
        prjFileDirectory = '..\matlab\data_file\hfss_file';
    % ---- 创建第三个元素scriptFileDirectory，本目录是脚本文件保存目录
        scriptFileDirectory = '..\matlab\data_file\vbs';
    % ---- 创建第四个元素dataFileDirectory，本目录是HFSS输出数据的保存目录
        dataFileDirectory = '..\matlab\data_file\hfss_data';
    % ---- 创建第五个元素hfssExecutePath，本目录是HFSS的执行路径
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                ---- 1： ----
                    此处"Program Files"需要加双引号，原因不明
                    但是如果HFSS没有安装在在Program Files里面，则不需要添加
                ---- 2： ----
                    对于HFSS 16.1，HFSS的执行文件是ansysedt.exe，不是hfss.exe
                    其他版本自行检查
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        hfssExecutePath = 'G:\"Program Files"\HFSS\AnsysEM16.1\Win64\ansysedt.exe';
    
    % ---- 将所有元素添加到fileDirectory中
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                %%%%%%%%%%%%%%%%%%%%%%
                % ---- 调用须知 ---- %
                %%%%%%%%%%%%%%%%%%%%%%
                %    因为此处是将所有的元素以cell数组方式储存的
                %    但是，HFSS路径不接受cell数组方式的路径
                %    因此需要在调用的时候将被调用的元素转化为字符串数组的形式
                %    也即使用char()函数
                %        例子：
                %            比如要使用第一个元素作为目录时，使用如下方式：
                %                char(tmpfileDirectory(1));
                %            将cell方式的数组转化为char类型的数组
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        fileDirectory = {hfssMatlabApiPath; prjFileDirectory; ...
            scriptFileDirectory; dataFileDirectory; hfssExecutePath};
    %{
        % ---- 测试fileDirectory数组
            [m, n] = size(fileDirectory);
            disp(m);
            disp(n);
            for ii = 1:1:m
                fprintf('当前的目录是：');
                disp(char(fileDirectory(ii));
                fprintf('\n');
            end
    %}