%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于执行建模脚本 ---- %
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
    global setupFreq startFreq stopFreq setupName sweepName            
%% ---- 加载参数文件
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            本脚本包含可重构天线模型所有的基本尺寸的数据
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    modelParametersForTest;
%% ---- 加载fileDirectoryParameters.m脚本
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            1.本脚本包含3个数组：
                第一个数组fileDirectoryOfLab对应的是实验室电脑的目录
                第二个数组fileDirectoryOfServer对应的是实验室服务器的目录
                第二个数组fileDirectoryOfThinkpad对应的是我的笔记本的目录

                使用的时候请根据使用环境，调用对应的数组

            2.每个数组包含5个元素：
                第一个元素hfssMatlabApiDirectory是HFSS-MATLAB-API所在目录
                第二个元素prjFileDirectory是工程文件保存目录
                第三个元素scriptFileDirectory是脚本文件保存目录
                第四个元素dataFileDirectory是HFSS输出数据的保存目录
                第五个元素hfssExecutePath是HFSS的执行路径

            3.之所这么做是因为在不同的运行环境，总是需要修改这些目录，
              因此将所有的目录统一在一个文件里面，
              并将同一个运行环境的目录保存在一个数组里面，
              这样执行文件只需要更改调用的数组即可，无需再修改原始目录
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    fileDirectoryParameters_V2ForTest;
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处之所以定义tmpfileDirectory，有两个优点：
                1.为了修改方便。更改运行环境之后，只需要将相应的数组赋值给tmpfileDirectory，
                  即可，无需多余的操作，极大地降低了操作的繁琐性。
                2.利用了封装的思想，使原数组对后面的操作不可见，保护了原数组的安全。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    tmpfileDirectory = fileDirectory;
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
    fileName = ['SwitchArray', num2str(tmpSwtichArray(end))];
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
    
                关于模型的创建，参见createUniteReconfigurableAntennaModelForTest.m
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
    createUniteReconfigurableAntennaModelForTest;
%% ---- 加载setupParametersOfHFSS脚本
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此脚本包含求解频率setupFreq和扫描频率sweep，以及它们对应的HFSS形式的字符串名字
            详细信息请参见setupParametersOfHFSS.m脚本
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----% %% ---- 输出数据
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

    %}
    setupParametersOfHFSSForOneFrequencyPoint;
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
%% ---- 移除HFSS-MATLAB-API的路径
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处需要将HFSS-MATLAB-API从MATLAB的路径中移除。
            移除代码需要与添加代码配合使用
            如果前面没有手动添加HFSS-MATLAB-API从MATLAB的路径的代码
            则此处不需要移除FSS-MATLAB-API路径
            如果移除，则会导致程序不能调用函数，需要重新在设置里添加路径           

            如果前面有手动添加的代码，则移除路径的代码如下；
                rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
                rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
                rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
                rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}