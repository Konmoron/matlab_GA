%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试模型的建立 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---- 说明 ---- %
% ---- 本脚本用于测试模型的建立



%% ---- clear and close
    clc;
    clear;
    close all;
    
    fprintf('clear and close---->完毕\n\n');




%% ---- 加载参数
    % ---- 正方形金属贴片的边长(patchLength)   9.398
        patchLength = 9.398;
    % ---- 相邻金属贴片中心距(centreDistence)	14.986
        centreDistance = 14.986;


    % ---- RF MEMS开关的长度(switchLength)	centreDistence - patchLength
        % ---- 为修改之前的长度
        % ---- switchLength = 2.159;

        % ---- 修改说明 ---- %
        % ---- 为了建模方便，开关的长度等于一个贴片的一边到另一个贴片的另一边的距离
        % ---- 也即是：centreDistence - patchLength
        switchLength = centreDistance - patchLength;
    % ---- RF MEMS开关的宽度(switchWidth)	1.27
        switchWidth = 1.27;


    % ---- 馈电线直径(portDiameter)	1.2
        portDiameter = 1.2;
    % ---- 输入端口直径(inputDiameter)	3
        inputDiameter = 3;
    % ---- 馈电点X轴坐标(portX)	3
        portX = 3;
    % ---- 馈电点Y轴坐标(portY)	3
        portY = 3;


    % ---- 正方形基底的厚度(height)	3.175
        height = 3.175;
    % ---- 正方形基底的边长(substrateLength)	52.5272
        % ---- 为修改之前的长度
        % substrateLength = 52.5272;

        % ---- 修改说明 ---- %
        % ---- 为了获取更好的性能，缩短基底的长度
        % ---- 缩短为：2*( centreDistance+0.8* patchLength)
        substrateLength = 2 * (centreDistance + 0.8 * patchLength);


    % ---- maxWavelength
        maxWavelength = 30;
    
    fprintf('参数加载---->完毕\n\n');




%% ---- 创建工程文件
    % ---- 通过vbs创建的HFSS文件的保存路径，ModelExecuteDemo.aedt是文件名
    % ---- 此处需要以.aedt作为文件的后缀，而不是.hfss，HFSS16.1的文件后缀是.aedt，其他版本的自行测试
    tmpPrjFile = 'G:\my_document\matlab\data_file\hfss_file\ModelDemo.aedt';
    
    fprintf('创建工程文件---->完毕\n\n');
    
    
%% ---- 创建脚本文件
    % ---- 脚本文件的保存路径，testModel.vbs是文件名
    tmpScriptFile = 'G:\my_document\matlab\data_file\vbs\ModelDemo.vbs';
    
    fprintf('创建脚本文件---->完毕\n\n');
    
    
    
    
%% ---- 添加HFSS-MATLAB-API的路径
    addpath('G:\my_document\matlab\hfss_matlab_api\3dmodeler');
    addpath('G:\my_document\matlab\hfss_matlab_api\analysis');
    addpath('G:\my_document\matlab\hfss_matlab_api\boundary');
    addpath('G:\my_document\matlab\hfss_matlab_api\general');
    
    fprintf('添加HFSS-MATLAB-API的路径---->完毕\n\n');

    
    
    
%% ---- 创建新的临时脚本文件
    fid = fopen(tmpScriptFile, 'wt');
    
    fprintf('创建新的临时脚本文件---->完毕\n\n');

    
    
    
%% ---- 创建新的工程和设计文件
    hfssNewProject(fid);
    hfssInsertDesign(fid,'ModelDemo');
    
    fprintf('创建新的工程和设计文件---->完毕\n\n');
    
    
    
%% ---- 使用脚本建模 ---- %%
%
% 
% 
% 
% 
% 
% 
    %% ---- 创建基板（Substrate）
        hfssBox(fid, 'Substrate', [-substrateLength/2, -substrateLength/2, 0], ...
            [substrateLength, substrateLength, height], 'mm');
        % ---- 设置材料
        hfssAssignMaterial(fid, 'Substrate', 'Rogers RT/duroid 5880 (tm)');
        % ---- 设置Color
        hfssSetColor(fid, 'Substrate', [132, 132, 193]);
        % ---- 设置透明度
        hfssSetTransparency(fid, {'Substrate'}, 0.6);
        
        fprintf('创建基板（Substrate）---->完毕\n\n');
    

    %% ---- 创建贴片阵列（Patch Array）
        % ---- 创建贴片11（Patch11）
            hfssRectangle(fid, 'Patch11', 'Z', [-(centreDistance + patchLength/2), ...
                -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch11', {'Patch11'});
            % ---- set Color
            hfssSetColor(fid, 'Patch11', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch11'}, 0);       
        % ---- 创建贴片12（Patch12）
            hfssRectangle(fid, 'Patch12', 'Z', [-(centreDistance + patchLength/2), ...
                -patchLength/2, height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch12', {'Patch12'});
            % ---- set Color
            hfssSetColor(fid, 'Patch12', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch12'}, 0);
        % ---- 创建贴片13（Patch13）
            hfssRectangle(fid, 'Patch13', 'Z', [-(centreDistance + patchLength/2), ...
                centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch13', {'Patch13'});
            % ---- set Color
            hfssSetColor(fid, 'Patch13', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch13'}, 0);
        
        
        % ---- 创建贴片21（Patch21）
            hfssRectangle(fid, 'Patch21', 'Z', [-patchLength/2, ...
                -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch21', {'Patch21'});
            % ---- set Color
            hfssSetColor(fid, 'Patch21', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch21'}, 0);
        % ---- 创建贴片22（Patch22）
            hfssRectangle(fid, 'Patch22', 'Z', [-patchLength/2, -patchLength/2, ...
                height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch22', {'Patch22'});
            % ---- set Color
            hfssSetColor(fid, 'Patch22', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch22'}, 0);
        % ---- 创建贴片23（Patch23）
            hfssRectangle(fid, 'Patch23', 'Z', [-patchLength/2, ...
                centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch23', {'Patch23'});
            % ---- set Color
            hfssSetColor(fid, 'Patch23', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch23'}, 0);
        
            
        % ---- 创建贴片31（Patch31）
            hfssRectangle(fid, 'Patch31', 'Z', [centreDistance - patchLength/2, ...
                -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch31', {'Patch31'});
            % ---- set Color
            hfssSetColor(fid, 'Patch31', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch31'}, 0);
        % ---- 创建贴片32（Patch32）
            hfssRectangle(fid, 'Patch32', 'Z', [centreDistance - patchLength/2, ...
                -patchLength/2, height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch32', {'Patch32'});
            % ---- set Color
            hfssSetColor(fid, 'Patch32', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch32'}, 0);
        % ---- 创建贴片33（Patch33）
            hfssRectangle(fid, 'Patch33', 'Z', [centreDistance - patchLength/2, ...
                centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
            hfssAssignPE(fid, 'Patch33', {'Patch33'});
            % ---- set Color
            hfssSetColor(fid, 'Patch33', [255, 255, 0]);
            % ---- set Transparency
            hfssSetTransparency(fid, {'Patch33'}, 0);
        
        fprintf('创建贴片阵列（Patch Array）---->完毕\n\n');
            

    %% ---- 创建开关（Switch）
        % ---- 加载switchArray文件
            %{ 
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    % ---- 本脚本只是用于产生一个数组testSwtichArray
                    % ---- 这个数组testSwtichArray只有0和1两个元素
                        % ---- 0代表开关断开
                        % ---- 1代表开关闭合


                    % ---- 数组元素的个数为12个，分别对应12个开关
                        % ---- 索引(1)代表Switch11
                        % ---- 索引(2)代表Switch12

                        % ---- 索引(3)代表Switch21
                        % ---- 索引(4)代表Switch22
                        % ---- 索引(5)代表Switch23

                        % ---- 索引(6)代表Switch31
                        % ---- 索引(7)代表Switch32

                        % ---- 索引(8)代表Switch41
                        % ---- 索引(9)代表Switch42
                        % ---- 索引(10)代表Switch43

                        % ---- 索引(11)代表Switch51
                        % ---- 索引(12)代表Switch52
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            switchArray;
            testSwtichArray = [1 1 1 1 1 1 1 1 1 1 1 1];
        % ---- 创建开关11（Switch11）
            if testSwtichArray(1) == 1
                hfssRectangle(fid, 'Switch11', 'Z', [-(centreDistance + switchWidth/2), ...
                    -(centreDistance - patchLength/2), height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch11', {'Switch11'});
                % ---- set Color
                hfssSetColor(fid, 'Switch11', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch11'}, 0);
            end
        % ---- 创建开关12（Switch12）
            if testSwtichArray(2) == 1
                hfssRectangle(fid, 'Switch12', 'Z', [-(centreDistance + switchWidth/2), ...
                    patchLength/2, height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch12', {'Switch12'});
                % ---- set Color
                hfssSetColor(fid, 'Switch12', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch12'}, 0);
            end
            
            
        % ---- 创建开关21（Switch21）
            if testSwtichArray(3) == 1
                hfssRectangle(fid, 'Switch21', 'Z', [-(centreDistance - patchLength/2), ...
                    -(centreDistance + switchWidth/2), height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch21', {'Switch21'});
                % ---- set Color
                hfssSetColor(fid, 'Switch21', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch21'}, 0);
            end
        % ---- 创建开关22（Switch22）
            if testSwtichArray(4) == 1
                hfssRectangle(fid, 'Switch22', 'Z', [-(centreDistance - patchLength/2), ...
                    -switchWidth/2, height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch22', {'Switch22'});
                % ---- set Color
                hfssSetColor(fid, 'Switch22', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch22'}, 0);
            end
        % ---- 创建开关23（Switch23）
            if testSwtichArray(5) == 1
                hfssRectangle(fid, 'Switch23', 'Z', [-(centreDistance - patchLength/2), ...
                    centreDistance - switchWidth/2, height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch23', {'Switch23'});
                % ---- set Color
                hfssSetColor(fid, 'Switch23', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch23'}, 0);
            end
            

        % ---- 创建开关31（Switch31）
            if testSwtichArray(6) == 1
                hfssRectangle(fid, 'Switch31', 'Z', [-switchWidth/2, -(centreDistance - patchLength/2), ...
                    height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch31', {'Switch31'});
                % ---- set Color
                hfssSetColor(fid, 'Switch31', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch31'}, 0);
            end
        % ---- 创建开关32（Switch32）
            if testSwtichArray(7) == 1
                hfssRectangle(fid, 'Switch32', 'Z', [-switchWidth/2, patchLength/2, ...
                    height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch32', {'Switch32'});
                % ---- set Color
                hfssSetColor(fid, 'Switch32', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch32'}, 0);
            end
            
            
        % ---- 创建开关41（Switch41）
            if testSwtichArray(8) == 1
                hfssRectangle(fid, 'Switch41', 'Z', [patchLength/2, -(centreDistance + switchWidth/2), ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch41', {'Switch41'});
                % ---- set Color
                hfssSetColor(fid, 'Switch41', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch41'}, 0);
            end
        % ---- 创建开关42（Switch42）
            if testSwtichArray(9) == 1
                hfssRectangle(fid, 'Switch42', 'Z', [patchLength/2, -switchWidth/2, ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch42', {'Switch42'});
                % ---- set Color
                hfssSetColor(fid, 'Switch42', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch42'}, 0);
            end
        % ---- 创建开关43（Switch43）
            if testSwtichArray(10) == 1
                hfssRectangle(fid, 'Switch43', 'Z', [patchLength/2, centreDistance - switchWidth/2, ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch43', {'Switch43'});
                % ---- set Color
                hfssSetColor(fid, 'Switch43', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch43'}, 0);
            end
            
            
        % ---- 创建开关51（Switch51）
            if testSwtichArray(11) == 1
                hfssRectangle(fid, 'Switch51', 'Z', [centreDistance - switchWidth/2, ...
                    -(centreDistance - patchLength/2), height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch51', {'Switch51'});
                % ---- set Color
                hfssSetColor(fid, 'Switch51', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch51'}, 0);
            end
        % ---- 创建开关52（Switch52）
            if testSwtichArray(12) == 1
                hfssRectangle(fid, 'Switch52', 'Z', [centreDistance - switchWidth/2, ...
                    patchLength/2, height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch52', {'Switch52'});
                % ---- set Color
                hfssSetColor(fid, 'Switch52', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch52'}, 0);
            end
            
            
%         % ---- 合并所有的贴片和开关
%             %{ 
%                 ---- 注意 ----
%                 ---- 注意 ----
%                 ---- 注意 ----
%                     hfssUnite这个函数有一个特性：
%                         它会将相连的合并，如果没有相连，就不合并，
%                         而且，如果Object不存在，则跳过
%                         简直就是神一般的函数啊
%                 ---- 注意 ----
%                 ---- 注意 ----
%                 ---- 注意 ----
%             %}
%             hfssUnite(fid, {'Patch11', 'Patch12', 'Patch13', 'Patch21', ...
%                 'Patch22', 'Patch23', 'Patch31', 'Patch32', 'Patch33', ...
%                 'Switch11', 'Switch12', 'Switch21', 'Switch22', 'Switch23', ...
%                 'Switch31', 'Switch32', 'Switch41', 'Switch42', 'Switch43', ...
%                 'Switch51', 'Switch52'});
            
        fprintf('创建开关（Switch）---->完毕\n\n'); 
         
         
    %% ---- 创建馈线（Feed）
        hfssCylinder(fid, 'Feed', 'Z', [portX, portY, 0], portDiameter/2, height, 'mm');
        % ---- 设置材料
        hfssAssignMaterial(fid, 'Feed', 'pec');
        
        fprintf('创建馈线（Feed）---->完毕\n\n');
    
    
    %% ---- 创建地平面（GND）
        hfssRectangle(fid, 'GroundPlane', 'Z', [-substrateLength/2, -substrateLength/2, 0], ...
            substrateLength, substrateLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'GND', {'GroundPlane'});
        % ---- 注意 ---- %
        % ---- 注意 ---- %
        % ---- 注意 ---- %
            % ---- hfssSubtract提供的Subtract没有Clone选项，因此执行操作之后，toolParts会被删除
            % ---- 因此，需要先画地平面，使用hfssSubtract，在地平面上留出Port平面
            % ---- 随后再创建馈电口（Port）
        % ---- 注意 ---- %
        % ---- 注意 ---- %
        % ---- 注意 ---- %
        % ---- 在GroundPlane上为Port预留空间
            % ---- 创建tempPort
                hfssCircle(fid, 'tempPort', 'Z', [portX, portY, 0], inputDiameter/2, 'mm');
            % ---- 使用hfssSubtract，在GroundPlane上去除tempPort部分，为Port留出空间
                hfssSubtract(fid, {'GroundPlane'}, {'tempPort'});
                
        fprintf('创建地平面（GND）---->完毕\n\n');
        
        
    %% ---- 创建馈电口（Port）
        hfssCircle(fid, 'Port', 'Z', [portX, portY, 0], inputDiameter/2, 'mm');
        % ---- Assign Lumped Port
        hfssAssignLumpedPort(fid, 'LumpedPort', 'Port', [portX + portDiameter/2, portY, 0], ...
            [portX + inputDiameter /2, portY, 0], 'mm');
        
        fprintf('创建馈电口（Port）---->完毕\n\n');
    
    
    %% ---- 创建空气盒子（Box）
        hfssBox(fid, 'AirBox', [-(centreDistance + 1.2 * patchLength + maxWavelength), ...
            -(centreDistance + 1.2 * patchLength + maxWavelength), -10], ...
            [2 * (centreDistance + 1.2 * patchLength + maxWavelength), ...
            2 * (centreDistance + 1.2 * patchLength + maxWavelength), ...
            height + maxWavelength + 10], 'mm');
        % ---- Assign Radiation
        hfssAssignRadiation(fid, 'AirBoxRadiation', 'AirBox');
        % ---- set Transparency
        hfssSetTransparency(fid, {'AirBox'}, 0.95);
        
        fprintf('创建空气盒子（Box）---->完毕\n\n');

%% ---- 添加求解频率
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            ---- 1： ----
                Setup4_4GHz是求解频率的名字
                此处一定要注意的是：
                    HFSS不接受Setup4.4GHz的命名方式，正确的命名方式是：Setup4_4GHz
            ---- 2： ----
                4.4是求解频率，0.02是求解精度，25是最大迭代次数
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    hfssInsertSolution(fid, 'Setup4_4GHz', 4, 0.02, 25);

    fprintf('添加求解频率---->完毕\n\n');

    
%% ---- 添加扫频设置
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            ---- 1： ----
                Sweep1To11GHz是扫频设置的名字
                此处一定要注意的是：
                    HFSS同样不接受“.”的命名方式，必须用“_”代替
            ---- 2： ----
                Setup4_4GHz是将这个扫频设置添加到那个求解频率里面
                如果有多个求解频率，则需要注意：添加到自己想要的求解频率下
            ---- 3： ----
                1是扫频范围的开始频率，11是扫频范围的结束频率，0.01是StepSize
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    hfssFastSweep(fid, 'Sweep1To11GHz', 'Setup4_4GHz', 1, 11, 0.01);
    
    fprintf('添加扫频设置---->完毕\n\n');
    
    
%% ---- 设置求解
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            ---- 1： ----
                如果想要HFSS仿真求解频率以及对应的扫频设置
                那么，一定要设置求解，也就是hfssSolveSetup
            ---- 2： ----
                Setup4_4GHz是具体要求解的频率
                    此处不需要具体到求解频率的扫频范围
            ---- 3： ----
                设置求解一定要在关闭fid之前，这个很重要
                    如果放在后面，HFSS将不会执行求解命令
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    hfssSolveSetup(fid, 'Setup4_4GHz');
    
    fprintf('设置求解---->完毕\n\n');


%% ---- 输出数据
    % ---- 创建数据输出文件名
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                tmpDataFile是输出文件的绝对路径
                    其中ModelDemoDataFile是输出的文件名，输出格式.m文件
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        tmpDataFile = 'G:\my_document\matlab\data_file\hfss_data\ModelDemoDataFile.m';
    % ---- 输出.m格式的数据文件
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                tmpDataFile是要输出的文件的路径
                Setup4_4GHz是要输出的求解频率
                Sweep1To10GHz是要输出的扫频范围，这个必须有
    
                数据输出hfssExportNetworkData必须放在hfssCloseActiveProject之前
                    否则HFSS执行完毕后会报错，导致HFSS不能正常退出，整个MATLAB程序不能正常运行
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        hfssExportNetworkData(fid, tmpDataFile, 'Setup4_4GHz', 'Sweep1To11GHz');
        
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
        hfssExecutePath = 'G:\"Program Files"\HFSS\AnsysEM16.1\Win64\ansysedt.exe'; 
    % ---- execute vbs
        fprintf('正在执行vbs脚本\n\n');
        hfssExecuteScript(hfssExecutePath, tmpScriptFile);
    
    fprintf('执行vbs脚本---->完毕\n\n');

    
% %% ---- 移除HFSS-MATLAB-API的路径
%     rmpath('G:\my_document\matlab\hfss_matlab_api\3dmodeler');
%     rmpath('G:\my_document\matlab\hfss_matlab_api\analysis');
%     rmpath('G:\my_document\matlab\hfss_matlab_api\boundary');
%     rmpath('G:\my_document\matlab\hfss_matlab_api\general');
%     
%     fprintf('移除HFSS-MATLAB-API的路径---->完毕\n\n');
%     
%     
%% ---- 运行数据脚本
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处运行数据脚本的目的是将输出的数据文件加载到内存
            run()函数的参数必须为变量名，也就是tmpDataFile，而不能是输出文件的名字
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    run(tmpDataFile);
    
    fprintf('运行数据脚本---->完毕\n\n');
    
    
%% ---- 得到指定开关组合状态的工作频率以及对应的S参数
    % ---- 得到S参数的最小值，以及对应的索引
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                此处使用函数min()，参数是S，也就是S参数
                min()函数有两个返回值：
                    Smin是S参数的最小值，是复数形式，需要对其转换
                    iMin是S参数最小值对应的索引，用以得到工作频率
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        [Smin, iMin] = min(S);
    % ---- 得到工作频率
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.iMin是S参数最小值对应的索引
    
                2.因为HFSS导出的数据形式Hz，为了得到GHz，需要将得到的频率除以10^9
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        freq = f(iMin) / 1e9;
	% ---- 得到实数格式的S参数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                由于HFSS输出的仿真参数为复数形式：S(1,:,:) = [9.608966E-001 -2.059262E-001i];，参见生成的数据文件
                因此，要想计算S参数，需要对数据进行处理，将复数形式的S参数转化为实数
    
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        % ----         转化公式          ---- %
                        % ---- 20*log10(abs(S(ii,:,:))) ---- %
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        s11 = 20*log10(abs(Smin));
    % ---- 输出当前开关状态的参数
        fprintf('工作频率是：%.2f，其对应的S11参数是：%.2f\n', freq, s11);
        
    fprintf('得到指定开关组合状态的工作频率以及对应的S参数---->完毕\n\n');

        
%% ---- 画天线的S参数随着Frequency变化的图形
    % ---- 调用画图命令，得到图形窗口
        figure;
    % ---- 画图
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                1.x轴为频率，但是需要注意的是：频率f需要除以10^9，将其转化为GHz
    
                2.y轴为S参数，需要将所有复数形式的S参数转化为实数形式：
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        % ----         转化公式          ---- %
                        % ---- 20*log10(abs(S(ii,:,:))) ---- %
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
                3.'b'代表blue，也就是为了让输出的线条颜色为蓝色
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        plot(f/1e9, 20*log10(abs(S)),'b');
    % ---- x轴的名字
        xlabel('Frequency(GHz)');
    % ---- y轴的名字
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                为了得到下标效果，需要使用：S_{11}
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        ylabel('S_{11} (dB)');
        
    fprintf('画天线的S11随着Frequency变化的图形---->完毕\n\n');