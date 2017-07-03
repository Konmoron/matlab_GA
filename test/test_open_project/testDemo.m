%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试MATLAB-HFSS-API的hfssOpenProject ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% ---- clear and close
clc;
clear;
close all;
fprintf('clear and close====完毕\n\n');



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




%% ---- 创建脚本和工程文件
tmpPrjFile = 'G:\my_document\matlab\data_file\hfss_file\testModel.aedt'; % ---- 通过vbs创建的HFSS文件的保存路径，testModel.aedt是文件名 % ---- 此处需要以.aedt作为文件的后缀，而不是.hfss，HFSS16.1的文件后缀是.aedt，其他版本的自行测试
tmpScriptFile = 'G:\my_document\matlab\data_file\vbs\testModel.vbs'; % ---- 脚本文件的保存路径，testModel.vbs是文件名
fprintf('创建脚本和工程文件====完毕\n\n');







% ---- 创建新的临时脚本文件
fid = fopen(tmpScriptFile, 'wt');
fprintf('创建新的临时脚本文件====完毕\n\n');



hfssProjectFile = 'G:\my_document\matlab\data_file\hfss_file\BasicModelNoSwitch.aedt';
designName = 'ModelForRA';
% ---- 创建新的工程和设计文件
hfssOpenProject(fid, hfssProjectFile);
hfssSetDesign(fid, designName);
% hfssNewProject(fid);
% hfssInsertDesign(fid,'Patch');
fprintf('创建新的工程和设计文件====完毕\n\n');







% ---- 使用脚本建模 ---- %





% ---- 创建介质基板

% ---- 创建基板
hfssBox(fid, 'Substrate1', [substrateLength/2, substrateLength/2, 0], [substrateLength + 100, substrateLength + 100, height + 100], 'mm');
% ---- 设置材料
hfssAssignMaterial(fid, 'Substrate1', 'FR4_epoxy');
% ---- 设置Color
hfssSetColor(fid, 'Substrate1', [0, 128, 0]);
% ---- 设置透明度
hfssSetTransparency(fid, {'Substrate1'}, 0.6);
fprintf('创建介质基板====完毕\n\n');




% ---- 保存
hfssSaveProject(fid, tmpPrjFile, true);
fprintf('保存====完毕\n\n');







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