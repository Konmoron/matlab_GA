% ==== 测试模型的建立 ====


% ---- clear and close
clc;
clear;
close all;
fprintf('clear and close====完毕\n\n');




% ---- 加载参数文件
allKnownParameters;
fprintf('参数加载====完毕\n\n');




% ---- 创建脚本和工程文件
tmpPrjFile = 'G:\my_document\HFSS\MATLAB\test\testModel.aedt'; % ---- 通过vbs创建的HFSS文件的保存路径，testModel.aedt是文件名 % ---- 此处需要以.aedt作为文件的后缀，而不是.hfss，HFSS16.1的文件后缀是.aedt，其他版本的自行测试
tmpScriptFile = 'G:\my_document\MATLAB\hfss_matlab\reconfigrable_antenna\test\testModel.vbs'; % ---- 脚本文件的保存路径，testModel.vbs是文件名
fprintf('创建脚本和工程文件====完毕\n\n');




% ---- 添加HFSS-MATLAB-API的路径
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
fprintf('添加HFSS-MATLAB-API的路径====完毕\n\n');




% ---- 创建新的临时脚本文件
fid = fopen(tmpScriptFile, 'wt');
fprintf('创建新的临时脚本文件====完毕\n\n');




% ---- 创建新的工程和设计文件
hfssNewProject(fid);
hfssInsertDesign(fid,'Basic');
fprintf('创建新的工程和设计文件====完毕\n\n');







% ---- 使用脚本建模 ---- %





% ---- 创建介质基板

% ---- 创建基板
hfssBox(fid, 'Substrate', [substrateLength/2, substrateLength/2, 0], [substrateLength, substrateLength, height], 'mm');
% ---- 设置材料
hfssAssignMaterial(fid, 'Substrate', 'FR4_epoxy');
% ---- 设置Color
hfssSetColor(fid, 'Substrate', [0, 128, 0]);
% ---- 设置透明度
hfssSetTransparency(fid, {'Substrate'}, 0.6);
fprintf('创建介质基板====完毕\n\n');




% ---- 保存
hfssSaveProject(fid, tmpPrjFile, true);
fprintf('保存====完毕\n\n');





% ---- 关闭fid
fclose(fid);
fprintf('关闭fid====完毕\n\n');




% ---- 移除HFSS-MATLAB-API的路径
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
fprintf('移除HFSS-MATLAB-API的路径====完毕\n\n');