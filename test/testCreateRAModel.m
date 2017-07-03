% ==== 本文用于测试createReconfigurableAntennaModel.m的使用 ==== 


    % ---- 
    % ---- 测试文件位置：G:\my_document\MATLAB\hfss_matlab\test\reconfigrable_antenna\model\createReconfigurableAntennaModel.m
    % ---- 


    % ---- 测试目的：
        % ---- 通过调用createReconfigurableAntennaModel.m，得到模型


%% ---- clear and close
    clc;
    clear;
    close all;
    
    fprintf('clear and close---->完毕\n\n');

    
%% ---- 加载参数文件
    allKnownParameters;
    
    fprintf('参数加载---->完毕\n\n');


%% ---- 创建工程文件
    % ---- 通过vbs创建的HFSS文件的保存路径，ModelExecuteDemo.aedt是文件名 
    % ---- 此处需要以.aedt作为文件的后缀，而不是.hfss，HFSS16.1的文件后缀是.aedt，其他版本的自行测试
    tmpPrjFile = 'G:\my_document\HFSS\MATLAB\reconfigrable_antenna\ModelUniteExecuteInterpolatingDemo.aedt'; 
    
    fprintf('创建工程文件---->完毕\n\n');
    
    
%% ---- 创建脚本文件
    % ---- 脚本文件的保存路径，testModel.vbs是文件名
    tmpScriptFile = 'G:\my_document\MATLAB\hfss_matlab\test\reconfigrable_antenna\model\ModelUniteExecuteInterpolatingDemo.vbs';
    
    fprintf('创建脚本文件---->完毕\n\n');
    

%% ---- 添加HFSS-MATLAB-API的路径
    addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
    addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
    addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
    addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
    
    fprintf('添加HFSS-MATLAB-API的路径---->完毕\n\n');


%% ---- 创建新的临时脚本文件
    fid = fopen(tmpScriptFile, 'wt');
    
    fprintf('创建新的临时脚本文件---->完毕\n\n');


%% ---- 创建新的工程和设计文件
    hfssNewProject(fid);
    hfssInsertDesign(fid,'ModelUniteExecuteInterpolatingDemo');
    
    fprintf('创建新的工程和设计文件---->完毕\n\n');
    

%% ---- 使用脚本建模 ---- %%
    % ---- 加载创建模型脚本
    createReconfigurableAntennaModel;
    
    
    %% ---- 添加求解频率
    hfssInsertSolution(fid, 'Setup4_2GHz', 4.2, 0.1, 20);
    
    fprintf('添加求解频率---->完毕\n\n');
    
    
%% ---- 添加扫频范围
    hfssInterpolatingSweep(fid, 'Interp1to10GHz', 'Setup4_2GHz', 1, 10, 1000, 101, 0.5);
    
    fprintf('添加扫频范围---->完毕\n\n');
    
 
%% ---- 设置求解扫频
    hfssSolveSetup(fid, 'Setup4_2GHz');
    
    fprintf('设置求解扫频---->完毕\n\n');    
    

%% ---- 输出数据
    % ---- 创建ModelExecuteDemoDataFile
        tmpDataFile = 'G:\my_document\MATLAB\data_file\test\reconfigrable_antenna\model\ModelUniteExecuteInterpolatingDemoDataFile.m';
    % ---- 输出.m格式的数据文件
        hfssExportNetworkData(fid, tmpDataFile, 'Setup4_2GHz', 'Interp1to10GHz');
        
    fprintf('输出数据---->完毕\n\n');
        
        
%% ---- 保存
    hfssSaveProject(fid, tmpPrjFile, true);
    
    fprintf('保存---->完毕\n\n');
    
      
%% ---- 关闭工程文件
    hfssCloseActiveProject(fid);
    
    fprintf('关闭工程文件---->完毕\n\n');
    
          
%% ---- 关闭fid
    fclose(fid);
    
    fprintf('关闭fid---->完毕\n\n');

 
%% ---- 执行vbs脚本
    % ---- HFSS执行路径
    hfssExecutePath = 'D:\"Program Files"\AnsysEM\AnsysEM16.1\Win64\ansysedt.exe'; 
    % ---- execute vbs
    fprintf('正在执行vbs脚本\n\n');
    hfssExecuteScript(hfssExecutePath, tmpScriptFile);
   
    fprintf('执行vbs脚本---->完毕\n\n');

     
% %% ---- 移除HFSS-MATLAB-API的路径
%     rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
%     rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
%     rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
%     rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
%     
%     fprintf('移除HFSS-MATLAB-API的路径---->完毕\n\n');
    