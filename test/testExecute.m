% ---- 测试在MATLAB里面调用HFSS执行vbs操作 ----




% ---- clear and close
clc;
clear;
close all;




% ---- HFSS的执行路径
hfssExecutePath = 'D:\"Program Files"\AnsysEM\AnsysEM16.1\Win64\ansysedt.exe'; % ---- 此处"Program Files"需要加双引号，不知道为什么，但是如果不在Program Files里面，貌似不需要添加
fprintf('添加HFSS的执行路径====完毕\n\n');




% ---- vbs脚本执行路径
tmpScriptFile = 'G:\my_document\MATLAB\hfss_matlab\reconfigrable_antenna\test\testModel.vbs'; % ---- vbs脚本在硬盘中的位置
fprintf('添加vbs脚本执行路径====完毕\n\n');




% ---- 添加HFSS-MATLAB-API的路径
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
addpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
fprintf('添加HFSS-MATLAB-API的路径====完毕\n\n');




% ----- 执行vbs脚本
fprintf('正在执行vbs脚本\n\n');
hfssExecuteScript(hfssExecutePath, tmpScriptFile);
fprintf('执行vbs脚本====完毕\n\n');




% ---- 移除HFSS-MATLAB-API的路径
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\3dmodeler');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\analysis');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\boundary');
rmpath('G:\my_document\MATLAB\hfss_matlab\hfss_api\general');
fprintf('移除HFSS-MATLAB-API的路径====完毕\n\n');


%% ---- 执行vbs脚本
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
            ---- 3： ----
                执行HFSS一定要放在关闭fid之后
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- HFSS执行路径
        hfssExecutePath = 'D:\"Program Files"\AnsysEM\AnsysEM16.1\Win64\ansysedt.exe'; 
    % ---- execute vbs
        fprintf('正在执行vbs脚本\n\n');
        hfssExecuteScript(hfssExecutePath, tmpScriptFile);
    
    fprintf('执行vbs脚本---->完毕\n\n');