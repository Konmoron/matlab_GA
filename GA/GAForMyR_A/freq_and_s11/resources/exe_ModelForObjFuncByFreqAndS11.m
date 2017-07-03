%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于执行建立脚本 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.执行建模脚本            
            % ---- 2.设置求解频率、扫频范围   
            % ---- 3.执行HFSS仿真            
            % ---- 4.输出仿真数据            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            

%% ---- 声明全局变量
    global setupFreq startFreq stopFreq setupName sweepName tmpfileDirectory m n;
%% ---- 添加HFSS-MATLAB-API的路径
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            1.此处需要将HFSS-MATLAB-API添加到MATLAB的路径。

            2.此处之所使用char()函数，是因为原数组是以cell数组方式储存的
              但是，HFSS路径不接受cell数组方式的路径
              因此需要在调用的时候将被调用的元素转化为字符串数组的形式
              也即使用char()函数
                  例子：
                      比如要使用第一个元素作为目录时，使用如下方式：
                          char(tmpfileDirectory(1));
                      将cell方式的数组转化为char类型的数组

        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    addpath(char(tmpfileDirectory(1)));
%% ---- 定义文件名
     %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            之所以定义文件名是因为后面有多处用到
                定义了之后，只需要修改此处的文件名
                通过字符串的拼接就可以得到其他最终的文件名
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    fileName = ['ObjFuncByFreqAndS11_' num2str(m) '_' num2str(n) '_R_A'];
%% ---- 创建工程文件
    % ---- 通过vbs创建的HFSS文件的保存路径，[fileName, '.aedt']是文件名
    % ---- 此处需要以.aedt作为文件的后缀，而不是.hfss，HFSS16.1的文件后缀是.aedt，其他版本的自行测试
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.此处之所使用char()函数，是因为原数组是以cell数组方式储存的
                  但是，HFSS路径不接受cell数组方式的路径
                  因此需要在调用的时候将被调用的元素转化为字符串数组的形式
                  也即使用char()函数
                      例子：
                          比如要使用第一个元素作为目录时，使用如下方式：
                              char(tmpfileDirectory(1));
                          将cell方式的数组转化为char类型的数组
                
                2.此处采用了字符串的拼接，最终得到要保存的文件的路径以及名字
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        tmpPrjFile = [char(tmpfileDirectory(2)), '\', fileName, '.aedt'];
%% ---- 创建脚本文件
    % ---- 脚本文件的保存路径，[fileName, '.vbs']是文件名
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.此处之所使用char()函数，是因为原数组是以cell数组方式储存的
                  但是，HFSS路径不接受cell数组方式的路径
                  因此需要在调用的时候将被调用的元素转化为字符串数组的形式
                  也即使用char()函数
                      例子：
                          比如要使用第一个元素作为目录时，使用如下方式：
                              char(tmpfileDirectory(1));
                          将cell方式的数组转化为char类型的数组
                
                2.此处采用了字符串的拼接，最终得到要保存的文件的路径以及名字
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        tmpScriptFile = [char(tmpfileDirectory(3)), '\', fileName, '.vbs'];
%% ---- 创建临时脚本文件
    fid = fopen(tmpScriptFile, 'wt');
%% ---- 创建新的工程和设计文件
    hfssNewProject(fid);
    hfssInsertDesign(fid, fileName);
%% ---- 使用脚本建模
    % ---- 加载模型脚本
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                此处用于加载模型脚本，创建模型
    
                关于模型的创建，参见相关脚本
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
    create_M_N_R_A_Model;
%% ---- 添加求解频率
    hfssInsertSolution(fid, setupName, setupFreq, 0.02, 20);
%% ---- 添加扫频范围
    hfssFastSweep(fid, sweepName, setupName, startFreq, stopFreq, 0.01);
%% ---- 求解扫频
    hfssSolveSetup(fid, setupName);
%% ---- 输出数据
    % ---- 创建数据输出文件，[fileName, 'DataFile.m']是文件名
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.此处之所使用char()函数，是因为原数组是以cell数组方式储存的
                  但是，HFSS路径不接受cell数组方式的路径
                  因此需要在调用的时候将被调用的元素转化为字符串数组的形式
                  也即使用char()函数
                      例子：
                          比如要使用第一个元素作为目录时，使用如下方式：
                              char(tmpfileDirectory(1));
                          将cell方式的数组转化为char类型的数组
                
                2.此处采用了字符串的拼接，最终得到要保存的文件的路径以及名字
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        tmpDataFile = [char(tmpfileDirectory(4)), '\', fileName, 'DataFile.m'];
    % ---- 输出.m格式的数据文件
        hfssExportNetworkData(fid, tmpDataFile, setupName, sweepName);
%% ---- 保存工程文件
    hfssSaveProject(fid, tmpPrjFile, true);
%% ---- 关闭工程文件
    hfssCloseActiveProject(fid);
%% ---- 关闭fid
    fclose(fid);
%% ---- 执行vbs脚本
    % ---- HFSS执行路径
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.此处之所使用char()函数，是因为原数组是以cell数组方式储存的
                  但是，HFSS路径不接受cell数组方式的路径
                  因此需要在调用的时候将被调用的元素转化为字符串数组的形式
                  也即使用char()函数
                      例子：
                          比如要使用第一个元素作为目录时，使用如下方式：
                              char(tmpfileDirectory(1));
                          将cell方式的数组转化为char类型的数组
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        hfssExecutePath = char(tmpfileDirectory(5));
    % ---- 通过MATLAB调用HFSS，执行脚本
        hfssExecuteScript(hfssExecutePath, tmpScriptFile);